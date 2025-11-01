
from pyspark.sql import SparkSession
from pyspark.sql.types import StructType,StructField,LongType,IntegerType,FloatType,StringType,TimestampType
from pyspark.sql.functions import split,from_json,col,to_timestamp


spark = SparkSession.builder\
    .appName("SSKafka")\
    .config("spark.jars.packages","org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.0")\
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

songSchema = StructType([
            StructField("name", StringType(), False),
            StructField("movie", StringType(), False),
            StructField("timestamp", StringType(), False),
            StructField("rating", IntegerType(), False)
        ])

df = spark.readStream\
    .format("kafka")\
    .option("kafka.bootstrap.servers", "localhost:29092")\
    .option("subscribe", "test")\
    .option("startingOffsets", "latest")\
    .load()

sdf = df.selectExpr("CAST(value AS STRING)")\
    .select(from_json(col("value"), songSchema).alias("data"))\
    .select("data.*")

sdf = sdf.withColumn("timestamp", to_timestamp(col("timestamp"), 'yyyy-MM-dd HH:mm:ss'))

netflix_df = spark.read\
    .option("header", True)\
    .csv("/vagrant/data/netflix.csv")

netflix_df = netflix_df.withColumn("release_year", col("release_year").cast(IntegerType())) \
                         .withColumn("duration", col("duration").cast(IntegerType()))

sdf = sdf.withColumnRenamed("rating", "user_rating")
netflix_df = netflix_df.withColumnRenamed("rating", "netflix_rating")

joined_df = sdf.join(netflix_df, sdf.movie == netflix_df.title, "left")

final_df = joined_df.select(
    col("name"),
    col("timestamp"),
    col("movie"),
    col("user_rating"),
    col("director"),
    col("country"),
    col("release_year"),
    col("duration")
)

def writeToCassandra(writeDF, _):
  writeDF.write\
      .format("org.apache.spark.sql.cassandra")\
      .mode('append')\
      .options(table="records", keyspace="spotify")\
      .save()

result = None
while result is None:
    try:
        # connect
        result = sdf.writeStream.option("spark.cassandra.connection.host","localhost:9042").foreachBatch(writeToCassandra).outputMode("update").start().awaitTermination()
    except:
         pass


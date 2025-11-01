from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, LongType, IntegerType, FloatType, StringType, TimestampType
from pyspark.sql.functions import split, from_json,col

spark = SparkSession \
    .builder \
    .appName("SSKafka") \
    .config("spark.jars.packages","org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.0") \
    .getOrCreate()
spark.sparkContext.setLogLevel("ERROR")

songSchema = StructType([
                StructField("name", StringType(), False),
    		StructField("movie", StringType(), False),
    		StructField("timestamp", StringType(), False),  
    		StructField("rating", IntegerType(), False)
            ])

df = spark \
  .readStream \
  .format("kafka") \
  .option("kafka.bootstrap.servers", "localhost:29092") \
  .option("subscribe", "test") \
  .option("startingOffsets", "latest") \
  .load() 

sdf = df.selectExpr("CAST(value AS STRING)").select(from_json(col("value"), songSchema).alias("data")).select("data.*")

sdf = sdf.withColumn("timestamp", col("timestamp").cast(TimestampType()))

sdf.writeStream \
  .outputMode("update") \
  .format("console") \
  .option("truncate", False) \
  .start() \
  .awaitTermination()
  
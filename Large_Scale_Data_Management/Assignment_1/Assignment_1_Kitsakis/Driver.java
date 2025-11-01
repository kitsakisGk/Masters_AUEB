package gr.aueb.panagiotisl.mapreduce.carsales;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class Driver {
    public static void main(String[] args) throws Exception {

        System.setProperty("hadoop.home.dir", "/");

        // Instantiate a configuration
        Configuration configuration = new Configuration();

        // Instantiate a job
        Job job = Job.getInstance(configuration, "Car Sales ");

        // Set job parameters
        job.setJarByClass(CarSales.class);
        job.setMapperClass(CarSales.SalesMapper.class);
        job.setReducerClass(CarSales.SalesReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);

        // Set I/O paths
        FileInputFormat.addInputPath(job, new Path("/user/hdfs/input/car_prices.csv"));
        FileOutputFormat.setOutputPath(job, new Path("/user/hdfs/output/carsales"));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
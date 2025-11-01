package gr.aueb.panagiotisl.mapreduce.carsales;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;

public class CarSales {

    
    public static class SalesMapper extends Mapper<Object, Text, Text, Text> {
        private static final String HEADER = "year,make,model,trim,body,transmission,vin,state,condition,odometer,color,interior,seller,mmr,sellingprice,saledate";

        @Override
        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String line = value.toString().trim();
            if (line.isEmpty() || line.startsWith(HEADER)) return;

            String[] fields = line.split(",");
            if (fields.length < 16) return;

            String seller = fields[12].trim();
            String dateField = fields[15].trim();
            String sellingPrice = fields[14].trim();
            String mmr = fields[13].trim();
            String make = fields[1].trim();
            String model = fields[2].trim();

            String[] dateParts = dateField.split(" ");
            if (dateParts.length < 2) return;

            String month = dateParts[1];
            String keyOut = seller + ":" + month;

            
            String valueOut = sellingPrice + "," + mmr + "," + make + " " + model;
            context.write(new Text(keyOut), new Text(valueOut));
        }
    }

    
    public static class SalesReducer extends Reducer<Text, Text, Text, Text> {
        @Override
        public void reduce(Text key, Iterable<Text> values, Context context) 
                throws IOException, InterruptedException {
            
            double maxDiff = Double.MIN_VALUE;
            String carWithMaxDiff = "";
            double totalDiff = 0.0;
            int count = 0;

            for (Text value : values) {
                String[] parts = value.toString().split(",");
                if (parts.length < 3) continue;

                double sellingPrice = Double.parseDouble(parts[0]);
                double mmr = Double.parseDouble(parts[1]);
                String carDetails = parts[2];
                double diff = sellingPrice - mmr;

                // Track max difference
                if (diff > maxDiff) {
                    maxDiff = diff;
                    carWithMaxDiff = carDetails;
                }

                // Track total and count for average
                totalDiff += diff;
                count++;
            }

            if (count == 0) return; 

            double avgDiff = totalDiff / count;

            
            String result = String.format("Car: %s, MaxDiff: %.2f, AvgDiff: %.2f", carWithMaxDiff, maxDiff, avgDiff);
            context.write(key, new Text(result));
        }
    }
}
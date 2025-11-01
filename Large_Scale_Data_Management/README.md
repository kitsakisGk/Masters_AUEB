<div align="center">

# Large-Scale Data Management

### Distributed Data Processing with Hadoop MapReduce, Spark Streaming, and Cassandra

[![Java](https://img.shields.io/badge/Java-11+-orange.svg)](https://www.oracle.com/java/)
[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![Hadoop](https://img.shields.io/badge/Hadoop-MapReduce-yellow.svg)](https://hadoop.apache.org/)
[![Spark](https://img.shields.io/badge/Apache-Spark-E25A1C.svg)](https://spark.apache.org/)
[![Kafka](https://img.shields.io/badge/Apache-Kafka-black.svg)](https://kafka.apache.org/)
[![Cassandra](https://img.shields.io/badge/Apache-Cassandra-1287B1.svg)](https://cassandra.apache.org/)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

[Overview](#overview) • [Assignment 1](#assignment-1-hadoop-mapreduce) • [Assignment 2](#assignment-2-streaming-pipeline) • [Setup](#setup)

---

</div>

## Overview

This repository contains implementations of large-scale data processing systems developed as part of the Large-Scale Data Management course at AUEB. The projects demonstrate proficiency in distributed computing frameworks and real-time data processing pipelines.

### 🎯 Key Technologies

- **Batch Processing:** Hadoop MapReduce
- **Stream Processing:** Apache Spark Streaming
- **Message Broker:** Apache Kafka
- **NoSQL Database:** Apache Cassandra
- **Containerization:** Docker, Docker Compose
- **Virtualization:** Vagrant

---

## Assignment 1: Hadoop MapReduce

### 📋 Project Description

Implements a **MapReduce job** to analyze car sales data, computing price differences between selling prices and Manheim Market Report (MMR) values.

### 🎯 Objectives

- Calculate maximum price difference (Selling Price - MMR) for each seller per month
- Compute average price difference per seller per month
- Handle large-scale dataset with distributed processing

### 🛠️ Implementation Details

**Mapper (`CarSales.SalesMapper`):**
- Parses car sales records
- Extracts: Seller Name, Sale Month, Price Difference
- Emits key-value pairs: `(seller_month, price_difference)`

**Reducer (`CarSales.SalesReducer`):**
- Aggregates price differences per seller-month
- Computes: Maximum and Average price differences
- Outputs results in structured format

### 📊 Dataset

- **Source:** Car sales transactions with MMR valuations
- **Fields:** Seller, Date, Selling Price, MMR, Make, Model, Year
- **Scale:** Designed for distributed processing across Hadoop cluster

### 🚀 Running the MapReduce Job

```bash
cd Assignment_1/Assignment_1_Kitsakis

# Compile the Java code
javac -classpath $(hadoop classpath) -d . Driver.java CarSales.java

# Package into JAR
jar -cvf carsales.jar -C . .

# Run on Hadoop
hadoop jar carsales.jar gr.aueb.panagiotisl.mapreduce.carsales.Driver
```

### 📈 Output Format

```
Seller_Month, MaxDifference, AvgDifference
John_Doe_2023-01, 5000.0, 2500.5
Jane_Smith_2023-01, 4200.0, 2100.3
```

---

## Assignment 2: Real-Time Streaming Data Pipeline

### 📋 Project Description

Builds an end-to-end **streaming data pipeline** that ingests, processes, and stores real-time movie rating data, enriching it with Netflix metadata.

### 🏗️ Architecture

```
[Data Source] → [Kafka] → [Spark Streaming] → [Cassandra]
                             ↓
                    [Netflix Static Data]
                         (Join)
```

### 🎯 Objectives

1. **Data Ingestion:** Stream rating events via Kafka
2. **Stream Processing:** Transform and enrich data with Spark Streaming
3. **Data Join:** Combine streaming ratings with static Netflix catalog
4. **Persistence:** Store processed records in Cassandra

### 🛠️ Tech Stack

| Component | Technology | Purpose |
|-----------|-----------|---------|
| **Message Broker** | Apache Kafka | Event streaming platform |
| **Stream Processing** | Apache Spark Streaming | Real-time data transformation |
| **Database** | Apache Cassandra | Distributed NoSQL storage |
| **Orchestration** | Docker Compose | Multi-container deployment |
| **Development** | Vagrant | Reproducible dev environment |

### 📊 Data Flow

**Incoming Stream (Kafka Topic: `test`):**
```json
{
  "name": "user123",
  "movie": "Inception",
  "timestamp": "2025-01-10 14:30:00",
  "rating": 5
}
```

**Static Netflix Data (`netflix.csv`):**
```
title, director, country, release_year, duration, rating
```

**Output to Cassandra (Keyspace: `spotify`, Table: `records`):**
- User name, timestamp, movie title
- User rating, director, country
- Release year, duration

### 🐳 Docker Services

The project uses three Docker Compose configurations:

**1. Kafka Setup (`docker-compose-kafka.yml`):**
- Zookeeper (coordination)
- Kafka Broker (port 29092)

**2. Spark Setup (`docker-compose-spark.yml`):**
- Spark Master
- Spark Worker nodes

**3. Cassandra Setup (`docker-compose-cassandra.yml`):**
- Cassandra cluster node

### 🚀 Running the Streaming Pipeline

**Step 1: Start Infrastructure**
```bash
cd Assignment_2/project-2

# Start Kafka
docker-compose -f docker-compose-kafka.yml up -d

# Start Cassandra
docker-compose -f docker-compose-cassandra.yml up -d

# Start Spark
docker-compose -f docker-compose-spark.yml up -d
```

**Step 2: Create Cassandra Schema**
```bash
# Access Cassandra container
docker exec -it <cassandra_container> cqlsh

# Create keyspace and table (see sql_query.txt)
```

**Step 3: Run Spark Streaming Job**
```bash
spark-submit \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.0,com.datastax.spark:spark-cassandra-connector_2.12:3.4.0 \
  examples/cassandra-spark-streaming-example.py
```

**Step 4: Produce Test Data to Kafka**
```bash
python examples/python-kafka-example.py
```

### 📝 Code Examples

**Python Kafka Producer:**
```python
# See examples/python-kafka-example.py
# Sends JSON messages to Kafka topic
```

**Spark Streaming Consumer:**
```python
# See examples/cassandra-spark-streaming-example.py
# - Reads from Kafka
# - Joins with Netflix CSV
# - Writes to Cassandra
```

---

## Setup

### Prerequisites

**Assignment 1 (Hadoop MapReduce):**
- Java JDK 11+
- Hadoop 3.x
- Maven (optional, for dependency management)

**Assignment 2 (Streaming Pipeline):**
- Python 3.8+
- Docker & Docker Compose
- Vagrant (for VM-based development)

### Installation

**Clone the repository:**
```bash
git clone https://github.com/kitsakisGk/large-scale-data-management.git
cd large-scale-data-management
```

**Assignment 2 Python Dependencies:**
```bash
pip install pyspark kafka-python
```

### Project Structure

```
large-scale-data-management/
│
├── Assignment_1/
│   └── Assignment_1_Kitsakis/
│       ├── Driver.java           # MapReduce job driver
│       ├── CarSales.java        # Mapper and Reducer
│       └── README.md
│
├── Assignment_2/
│   └── project-2/
│       ├── docker-compose-kafka.yml
│       ├── docker-compose-spark.yml
│       ├── docker-compose-cassandra.yml
│       ├── examples/
│       │   ├── cassandra-spark-streaming-example.py
│       │   ├── python-kafka-example.py
│       │   └── console-spark-streaming-example.py
│       ├── data/
│       │   └── netflix.csv
│       ├── Vagrantfile
│       └── README.md
│
├── Final_Exam/
│   └── [Exam materials]
│
└── README.md                    # This file
```

---

## Learning Outcomes

### Skills Demonstrated

✅ **Distributed Computing**
- Hadoop MapReduce job implementation
- Data partitioning and parallel processing
- Shuffle and sort optimization

✅ **Stream Processing**
- Real-time data ingestion with Kafka
- Spark Structured Streaming API
- Stateless stream transformations

✅ **Data Engineering**
- ETL pipeline design
- Stream-static data joins
- Schema evolution handling

✅ **Big Data Ecosystem**
- Multi-service architecture deployment
- Containerization with Docker
- NoSQL database integration

✅ **DevOps Practices**
- Infrastructure as Code (Docker Compose)
- Reproducible environments (Vagrant)
- Service orchestration

---

## Challenges & Solutions

### Challenge 1: Kafka-Spark Integration
**Problem:** Compatibility issues between Kafka and Spark versions
**Solution:** Used Spark package `spark-sql-kafka-0-10_2.12:3.5.0` matching Scala 2.12

### Challenge 2: Cassandra Connection
**Problem:** Spark unable to connect to Cassandra in Docker
**Solution:** Configured proper network bridge and connection retry logic

### Challenge 3: Timestamp Parsing
**Problem:** Inconsistent timestamp formats in streaming data
**Solution:** Implemented robust parsing with `to_timestamp()` function

---

## Future Enhancements

- [ ] Add monitoring with Grafana/Prometheus
- [ ] Implement exactly-once semantics with Kafka transactions
- [ ] Add data quality checks with Great Expectations
- [ ] Scale to multi-node Cassandra cluster
- [ ] Implement windowed aggregations in Spark
- [ ] Add CI/CD pipeline for automated testing

---

## References

- [Apache Hadoop Documentation](https://hadoop.apache.org/docs/)
- [Apache Spark Streaming Guide](https://spark.apache.org/docs/latest/streaming-programming-guide.html)
- [Apache Kafka Documentation](https://kafka.apache.org/documentation/)
- [DataStax Cassandra Documentation](https://docs.datastax.com/)

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

**Georgios Kitsakis**
- GitHub: [@kitsakisGk](https://github.com/kitsakisGk)
- LinkedIn: [Add your LinkedIn]

---

<div align="center">

**Athens University of Economics and Business**
*Master's in Data Science*

Made with ❤️ for Big Data

</div>

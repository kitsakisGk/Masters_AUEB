import json
import asyncio
import random
from datetime import datetime
from aiokafka import AIOKafkaProducer
from faker import Faker

# Create a Faker instance
fake = Faker()

topic = 'test'

# Read movies from movies.csv
movies = []
with open("data/movies.csv", "r", encoding="utf-8") as file:
    for line in file:
        stripped_line = line.strip()
        if stripped_line:
            movies.append(stripped_line)

usernames = [fake.name() for _ in range(10)]
usernames.append("Georgios Kitsakis")

def serializer(value):
    return json.dumps(value).encode()

async def produce():
    producer = AIOKafkaProducer(
        bootstrap_servers='localhost:29092',
        value_serializer=serializer,
        compression_type="gzip")

    await producer.start()
    try:
        while True:
            user = random.choice(usernames)
            movie = random.choice(movies)
            rating = random.randint(1, 10)
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

            data = {
                "name": user,
                "movie": movie,
                "timestamp": timestamp,
                "rating": rating
            }
            
            await producer.send(topic, data)
            print(f"Sent: {data}")
            
            await asyncio.sleep(random.randint(1, 5))  
    finally:
        await producer.stop()

if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(produce())



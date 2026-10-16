import requests
from database import get_connection

url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url)

users = response.json()

conn = get_connection()

cursor = conn.cursor()

for user in users:

    cursor.execute(
        """
        INSERT INTO customers
        (
            customer_id,
            customer_name,
            email,
            city
        )
        VALUES
        (
            %s,
            %s,
            %s,
            %s
        )
        ON CONFLICT (customer_id)
        DO NOTHING
        """,
        (
            user["id"],
            user["name"],
            user["email"],
            user["address"]["city"]
        )
    )

conn.commit()

cursor.close()

conn.close()

print("Data loaded successfully")
import psycopg2

def get_connection():

    conn = psycopg2.connect(
        host="localhost",
        database="company",
        user="postgres",
        password="admin"
    )

    return conn
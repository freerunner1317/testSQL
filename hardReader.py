import mysql.connector
from mysql.connector import Error

def create_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")

    return connection

def execute_read_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as e:
        print(f"The error '{e}' occurred")


connection = create_connection("localhost", "root", "root", "test_ex")    

sql = """
    SELECT * 
    FROM 
    test_ex.authors
    WHERE
    authors.id = (SELECT 
        books.author_id
        FROM 
        books, give_out
        WHERE 
        give_out.id_book = books.id AND give_out.date_issue > DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
        GROUP BY 
        books.author_id 
        ORDER BY
        COUNT(books.author_id) 
        DESC LIMIT 1)
"""

users = execute_read_query(connection, sql)


for user in users:
    print(user)
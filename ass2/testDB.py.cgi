#/usr/bin/env python

import sys
import sqlite3

# create a database in RAM
db = sqlite3.connect(':memory:')

# get a cursor object
cursor = db.cursor()
cursor.execute('''
        CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            name TEXT,
            phone TEXT,
            email TEXT unique,
            password TEXT
        )
''')
db.commit()

cursor = db.cursor()

name1 = 'Andres'
phone1 = '3366858'
email1 = 'user@example.com'
password1 = '12345'
 
name2 = 'John'
phone2 = '5557241'
email2 = 'johndoe@example.com'
password2 = 'abcdef'

# insert user1
cursor.execute('''
        INSERT INTO users(name, phone, email, password)
        VALUES(?,?,?,?)''', (name1, phone1, email1, password1)
)

cursor.execute('''
        INSERT INTO users(name, phone, email, password)
        VALUES(?,?,?,?)''', (name2, phone2, email2, password2)
)

db.commit()

print '''Content-type: text/html

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>SQLite DB test</title>
    </head>

    <body>
        Hello World
    </body>
</html>

'''

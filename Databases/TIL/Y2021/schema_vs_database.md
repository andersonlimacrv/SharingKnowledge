[source](https://techdifferences.com/difference-between-schema-and-database.html)
[source](https://www.geeksforgeeks.org/difference-between-schema-and-database/)
### definition

```html
Schema is a structural definition or description of an entire database.
Once you declare the schema of a database, it should not be changed frequently
as it will disturb the organisation of data in a database.
```

```html
The database is a collection of well-organised and interrelated data.
The database includes structure (Schema), data types and constraints of the data to be stored and the data i.e. facts or information about an object in consideration.
```


~~~html
schema vs database and give example

ANSWER
A database is a collection of well-organized and interrelated data, while a schema is a structural definition or description of an entire database techdifferences.com.

Schemas are like folders within a database and are mainly used to group logical objects together, which leads to ease of setting permissions by schema stackoverflow.com. They can be displayed in the form of a schema diagram, which shows the tables, their attributes, and relationships between them. However, schema diagrams do not show instances of the database or attribute types techdifferences.com.

Databases, on the other hand, include the structure (schema), data types, constraints of the data to be stored, and the actual data. The data in a database is updated frequently, and a snapshot of the data at a particular moment is called a database instance techdifferences.com.

For example, consider a university database. The schema would define the structure, including tables for students, courses, and enrollments, along with their attributes and relationships. The database would store the actual data, such as the information about each student, the courses offered, and which students are enrolled in which courses.

Here's a simple example illustrating the difference:
~~~

##### Schema:
~~~

~~~sql
CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);

CREATE TABLE courses (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  credits INT
);

CREATE TABLE enrollments (
  student_id INT REFERENCES students(id),
  course_id INT REFERENCES courses(id),
  grade VARCHAR(2)
);
~~~

##### Database:
~~~sql
INSERT INTO students (id, name, age) VALUES (1, 'Alice', 20);
INSERT INTO students (id, name, age) VALUES (2, 'Bob', 22);

INSERT INTO courses (id, name, credits) VALUES (1, 'Math', 4);
INSERT INTO courses (id, name, credits) VALUES (2, 'History', 3);

INSERT INTO enrollments (student_id, course_id, grade) VALUES (1, 1, 'A');
INSERT INTO enrollments (student_id, course_id, grade) VALUES (2, 2, 'B');
In this example, the schema defines the structure of the tables (students, courses, and enrollments), while the database contains the actual data (student and course information, and enrollment records) techdifferences.com.
~~~

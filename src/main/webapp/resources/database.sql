CREATE TABLE students
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    surname VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    phone BIGINT,
    CONSTRAINT students_PK PRIMARY KEY (id)
);

CREATE TABLE teachers
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    surname VARCHAR(50) NOT NULL,
    phone BIGINT,
    email VARCHAR(30),
    password VARCHAR(30) NOT NULL,
    CONSTRAINT teachers_PK PRIMARY KEY (id),
    CONSTRAINT teachers_U UNIQUE (email)
);

INSERT INTO teachers (name, surname, phone, email, password) values ('aaaa', 'AAAA', 111111111, 'aaaa@aaaa.com', 'aaaa');
INSERT INTO teachers (name, surname, phone, email, password) values ('bbbb', 'BBBB', 111111111, 'bbbb@bbbb.com', 'bbbb');
INSERT INTO teachers (name, surname, phone, email, password) values ('cccc', 'CCCC', 333333333, 'cccc@cccc.com', 'cccc');

CREATE TABLE courses
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name varchar(30),
    CONSTRAINT courses_PK PRIMARY KEY (id)
);

CREATE TABLE enrollments
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    CONSTRAINT courses_PK PRIMARY KEY (id),
    CONSTRAINT enrollments_U UNIQUE (student_id, course_id),
    CONSTRAINT enrollments_id_student_FK FOREIGN KEY (student_id) REFERENCES students(id),
    CONSTRAINT enrollments_id_course_FK FOREIGN KEY (course_id) REFERENCES courses(id)
);


INSERT INTO students(name, surname, date_of_birth, phone) VALUES ('aaaa', 'AAAA', '1990-01-01', 111111111);
INSERT INTO students(name, surname, date_of_birth, phone) VALUES ('bbbb', 'BBBB', '1991-02-02', 222222222);
INSERT INTO students(name, surname, date_of_birth, phone) VALUES ('cccc', 'CCCC', '1994-12-24', 333333333);

INSERT INTO courses (name) VALUES ('A'), ('B'), ('C'), ('D'), ('E');

INSERT INTO enrollments(course_id, student_id) VALUES 
(1, 1), (1, 2),
(2, 3), (2, 5),
(3, 8),(3, 1),
(4, 2),(4, 5),
(5, 2);

-- loadStudentsFromCourse
SELECT s.id, s.name, s.surname, s.date_of_birth, s.phone FROM students s 
INNER JOIN enrollments e on (s.id = e.student_id) 
INNER JOIN courses c ON (c.id = e.course_id) WHERE c.id = ?;

-- loadStudentsOutsideOfTheCourse
SELECT s.id, s.name, s.surname, s.date_of_birth, s.phone FROM students s WHERE s.id NOT IN(
    SELECT s.id FROM students s 
    INNER JOIN enrollments e on (s.id = e.student_id) 
    INNER JOIN courses c ON (c.id = e.course_id) 
    WHERE c.id = ?
);
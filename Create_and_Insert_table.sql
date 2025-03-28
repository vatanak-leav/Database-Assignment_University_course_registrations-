CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    department_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade DECIMAL(3, 1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO departments (name) VALUES 
('IT engineering'), ('Bio Engineering'), ('Data Science');

INSERT INTO faculty (first_name, last_name, email, department_id) VALUES
('Vann', 'Da', 'vannda@baramey.com', 1),
('G', 'Devith', 'gdevith@ditway.com', 2),
('Vin', 'Vitou', 'vitou@clapyahand.com', 3);


INSERT INTO students (first_name, last_name, date_of_birth, email) VALUES
('Leav', 'Sovatanak', '2003-06-18', 'leav.sovatanak.2822@rupp.edu.kh'),
('Chan', 'Chav', '2002-02-13', 'chan.chav.2810@rupp.edu.kh'),
('Van', 'Nguyen', '2002-03-22', 'van.nguyen@rupp.edu.kh'),
('Van', 'Chesda', '2000-01-01', 'vann.chesda.2829@rupp.edu.kh');

INSERT INTO courses (course_code, course_name, faculty_id, department_id) VALUES
('CS101', 'Computer fundametal', 1, 1),
('MATH201', 'Calculus I', 1, 3),
('BIO302', 'Biology I', 2, 3);



INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2025-03-10', 3.7),
(1, 3, '2025-03-12', 3.5),
(2, 1, '2025-03-15', 3.2),
(3, 2, '2025-03-20', 2.9);

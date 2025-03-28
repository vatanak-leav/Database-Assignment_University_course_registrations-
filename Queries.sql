-- 1. Retrieve all students who enrolled in a specific course 
SELECT s.student_id, s.first_name, s.last_name, c.course_code
FROM students s
JOIN enrollments e ON s.student_id = e.student_id     --  joins students and enrollments
JOIN courses c ON e.course_id = c.course_id			  --  joins courses and enrollments
WHERE c.course_code = 'CS101';


-- 2. Find all faculty members in a particular department
SELECT f.faculty_id, f.first_name, f.last_name, d.name AS department
FROM faculty f
JOIN departments d ON f.department_id = d.department_id  -- join faculty and departments
WHERE d.name = 'IT Engineering';                         -- and filter by department name to get faculty members in that department


-- 3. List all courses a particular student is enrolled in
SELECT c.course_code, c.course_name, s.first_name, s.last_name
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id   
JOIN students s ON e.student_id = s.student_id
WHERE s.student_id = 1;        



-- 4. Retrieve students who have not enrolled in any course
SELECT s.student_id, s.first_name, s.last_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id    -- use a LEFT JOIN to include all students
WHERE e.enrollment_id IS NULL;							  -- and filter those who have no matching enrollment records



-- 5. Find the average grade of students in a specific course
SELECT c.course_code, AVG(e.grade) AS average_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE c.course_code = 'CS101'
GROUP BY c.course_code;
-- calculates the average grade for a specific course using aggregation (AVG) and GROUP BY

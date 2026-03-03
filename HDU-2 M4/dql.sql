-- list all students with their inscription
SELECT 
	i.inscription_id,
	s.student_name,
	c.course_name,
	i.final_grade
FROM inscriptions i
INNER JOIN students s 
	ON i.student_id = s.student_id
INNER JOIN courses c
	ON i.course_id = c.course_id
ORDER BY s.student_name ASC;

-- courses taught by teachers with more than 5 years of experience
SELECT 
	c.course_name,
	t.teacher_name,
	ad.department_name,
	t.years_experience
FROM courses c
INNER JOIN teachers t
	ON c.teacher_id = t.teacher_id
INNER JOIN academic_departments ad
	ON t.department_id = ad.department_id
WHERE t.years_experience >= 5
ORDER BY t.teacher_name ASC;

-- obtain grade point average per course
SELECT 
    c.course_name, 
    AVG(i.final_grade) AS promedio_notas
FROM courses c
INNER JOIN inscriptions i 
	ON c.course_id = i.course_id
GROUP BY c.course_name 
ORDER BY promedio_notas DESC;

-- students enrolled in more than one course 
SELECT 
    s.student_name, 
    COUNT(i.inscription_id) AS total_courses
FROM students s
INNER JOIN inscriptions i 
	ON s.student_id = i.student_id
GROUP BY s.student_name
HAVING COUNT(i.inscription_id) > 1
ORDER BY total_cursos DESC;

-- add column in student table
ALTER TABLE students 
ADD COLUMN academic_status academic_status NOT NULL DEFAULT 'Active';

-- try delete teacher => you cannot do that because it has relationships with other tables. 
DELETE FROM teachers WHERE teacher_id = 1;

-- courses with more than 2 students enrolled
SELECT
	c.course_name,
	COUNT(i.student_id) AS total_students
FROM courses c
INNER JOIN inscriptions i
	ON c.course_id = i.course_id
GROUP BY c.course_name
ORDER BY total_students DESC; 

/*
	subqueries and functions
*/

-- students whose grade point average is > overall average 
SELECT 
    s.student_name, 
    ROUND(AVG(i.final_grade), 2) AS promedio_estudiante
FROM students s
INNER JOIN inscriptions i 
	ON s.student_id = i.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(i.final_grade) > (
    SELECT AVG(final_grade) 
	FROM inscriptions
)
ORDER BY promedio_estudiante DESC;

-- names of majors with students enrolled in courses for the semester ≥ 2 
SELECT degree_name
FROM degrees
WHERE degree_id IN (
    SELECT DISTINCT s.degree_id
    FROM students s
    JOIN inscriptions i ON s.student_id = i.student_id
    JOIN courses c ON i.course_id = c.course_id
    WHERE c.course_semester >= 2
);

-- overview of the races
SELECT 
    d.degree_name AS "Degrees",
    COUNT(i.inscription_id) AS "Total Inscriptions",
    ROUND(AVG(i.final_grade), 2) AS "General average",
    SUM(c.course_credits) AS "Total Credits Enrolled",
    MAX(i.final_grade) AS "Max Grade",
    MIN(i.final_grade) AS "Min Grade"
FROM degrees d
JOIN students s ON d.degree_id = s.degree_id
JOIN inscriptions i ON s.student_id = i.student_id
JOIN courses c ON i.course_id = c.course_id
GROUP BY d.degree_name
ORDER BY "General average" DESC;

/*
	views
*/

CREATE VIEW academic_history_view AS 
SELECT
	s.student_name AS "Student Name",
	c.course_name AS "Course Name",
	t.teacher_name AS "Teacher Name",
	c.course_semester AS "Semester",
	i.final_grade AS "Final Grade"
FROM inscriptions i
INNER JOIN students s
	ON i.student_id = s.student_id
INNER JOIN courses c
	ON i.course_id = c.course_id
INNER JOIN teachers t
	ON c.teacher_id = t.teacher_id 

SELECT * FROM academic_history_view;

/*
	Access control and security
*/

CREATE ROLE academic_reviewer;

-- read-only permissions in the view 
GRANT SELECT ON academic_history_view TO academic_reviewer;

REVOKE INSERT, UPDATE, DELETE ON inscriptions FROM academic_reviewer;

-- transaction
BEGIN;

UPDATE inscriptions SET final_grade = 4.8 WHERE inscription_id = 1;
SAVEPOINT first_update; -- save a bookmark so we can come back later.

UPDATE inscriptions SET final_grade = 1.0 WHERE inscription_id = 2; -- query we didn't want to ask
ROLLBACK TO SAVEPOINT first_update; -- return to the mark we left

UPDATE inscriptions SET final_grade = 4.5 WHERE inscription_id = 3;
COMMIT; --apply permanent changes
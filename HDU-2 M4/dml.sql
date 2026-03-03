-- Academic Departments
INSERT INTO academic_departments (department_name, department_description) VALUES
('Mathematics', 'Department of pure and applied mathematics'),
('Computer Science', 'Software engineering and data science'),
('Physics', 'Experimental and theoretical physics'),
('Health Sciences', 'Medical and nursing research');

-- Degrees
INSERT INTO degrees (degree_name, degree_description) VALUES
('Systems Engineering', 'Focus on software and infrastructure'),
('Data Science', 'Statistics and machine learning'),
('Medicine', 'General medicine and surgery'),
('Physics Engineering', 'Advanced physics and technology');

-- Teachers
INSERT INTO teachers (department_id, teacher_name, institutional_email, years_experience) VALUES
(2, 'Alan Turing', 'turing@university.edu', 15),
(2, 'Grace Hopper', 'hopper@university.edu', 12),
(1, 'Katherine Johnson', 'johnson@university.edu', 20),
(1, 'Terence Tao', 'tao@university.edu', 8),
(3, 'Marie Curie', 'curie@university.edu', 18),
(3, 'Richard Feynman', 'feynman@university.edu', 14),
(4, 'Elizabeth Blackwell', 'blackwell@university.edu', 10),
(4, 'Gregory House', 'house@university.edu', 22),
(2, 'Margaret Hamilton', 'hamilton@university.edu', 16);

-- Students
INSERT INTO students (degree_id, student_name, student_email, date_birth, identity_document, gender) VALUES
(1, 'Alice Smith', 'alice@mail.com', '2002-05-14', 'ID-001', 'Femenine'),
(1, 'Bob Jones', 'bob@mail.com', '2001-08-22', 'ID-002', 'Masculine'),
(2, 'Charlie Brown', 'charlie@mail.com', '2003-01-10', 'ID-003', 'Others'),
(2, 'Diana Prince', 'diana@mail.com', '2000-11-30', 'ID-004', 'Femenine'),
(3, 'Edward Stark', 'edward@mail.com', '2002-03-15', 'ID-005', 'Masculine'),
(3, 'Fiona Gallagher', 'fiona@mail.com', '2001-07-19', 'ID-006', 'Femenine'),
(4, 'George Miller', 'george@mail.com', '2003-09-05', 'ID-007', 'Masculine'),
(4, 'Hannah Arendt', 'hannah@mail.com', '2000-04-25', 'ID-008', 'Femenine'),
(1, 'Ian Wright', 'ian@mail.com', '2002-12-12', 'ID-009', 'No binary'),
(2, 'Julia Roberts', 'julia@mail.com', '2001-06-06', 'ID-010', 'Femenine'),
(3, 'Kevin Hart', 'kevin@mail.com', '2003-02-28', 'ID-011', 'Masculine'),
(4, 'Laura Palmer', 'laura@mail.com', '2000-10-10', 'ID-012', 'Femenine'),
(1, 'Miles Davis', 'miles@mail.com', '2002-01-01', 'ID-013', 'Masculine'),
(2, 'Nina Simone', 'nina@mail.com', '2001-03-03', 'ID-014', 'Femenine'),
(3, 'Oscar Wilde', 'oscar@mail.com', '2003-05-05', 'ID-015', 'Others');

-- Courses
INSERT INTO courses (course_code, teacher_id, course_name, course_credits, course_semester) VALUES
('CS101', 1, 'Introduction to Algorithms', 4.0, 1),
('CS202', 2, 'Compiler Design', 3.0, 4),
('MATH301', 3, 'Linear Algebra', 4.0, 2),
('MATH405', 4, 'Calculus III', 4.0, 3),
('PHY101', 5, 'General Physics', 3.0, 1),
('PHY205', 6, 'Quantum Mechanics', 5.0, 6),
('MED101', 7, 'Human Anatomy', 6.0, 1),
('MED305', 8, 'Advanced Diagnostics', 5.0, 5),
('CS505', 9, 'Software Engineering', 4.0, 5),
('MATH101', 3, 'Basic Geometry', 2.0, 1),
('CS303', 1, 'Database Systems', 4.0, 3),
('PHY302', 6, 'Thermodynamics', 3.0, 4);

-- Inscriptions
INSERT INTO inscriptions (student_id, course_id, inscription_date, final_grade) VALUES
(1, 1, '2026-02-01', 4.5), (1, 3, '2026-02-01', NULL),
(2, 1, '2026-02-01', 3.8), (2, 9, '2026-02-05', 4.2),
(3, 2, '2026-02-01', 5.0), (3, 11, '2026-02-02', NULL),
(4, 4, '2026-02-01', 4.0), (4, 10, '2026-02-01', 4.8),
(5, 7, '2026-02-01', 3.5), (5, 8, '2026-02-03', NULL),
(6, 7, '2026-02-01', 4.1), (6, 8, '2026-02-03', 4.3),
(7, 5, '2026-02-01', 3.9), (7, 6, '2026-02-05', NULL),
(8, 5, '2026-02-01', 4.7), (8, 12, '2026-02-05', 4.9),
(9, 1, '2026-02-01', 3.2), (10, 2, '2026-02-01', 4.4),
(11, 7, '2026-02-01', NULL), (12, 5, '2026-02-01', 4.6),
(13, 11, '2026-02-01', 4.0), (14, 4, '2026-02-01', 3.7),
(15, 6, '2026-02-01', NULL), (1, 11, '2026-02-10', 4.8);
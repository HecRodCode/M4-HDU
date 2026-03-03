CREATE TYPE student_gender AS ENUM ('Masculine', 'Femenine', 'No binary', 'Others');

CREATE TABLE degrees(
	degree_id SERIAL PRIMARY KEY,
	degree_name VARCHAR(200) NOT NULL,
	degree_description TEXT
);

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,

	degree_id INTEGER NOT NULL 
		REFERENCES degrees(degree_id),

	student_name VARCHAR(250) NOT NULL,
	student_email VARCHAR(200) NOT NULL UNIQUE,
	date_birth DATE NOT NULL,
	identity_document VARCHAR(100) NOT NULL UNIQUE,
	gender student_gender NOT NULL,
	admission_date DATE NOT NULL DEFAULT CURRENT_DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE academic_departments(
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(250) NOT NULL,
	department_description TEXT
);

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,

	department_id INTEGER NOT NULL
		REFERENCES academic_departments(department_id),

	teacher_name VARCHAR(250) NOT NULL,
	institutional_email VARCHAR(200) NOT NULL UNIQUE,
	years_experience INTEGER NOT NULL
		CHECK (years_experience >= 0)
);

CREATE TABLE courses(
	course_id SERIAL PRIMARY KEY,
	course_code VARCHAR(100) NOT NULL UNIQUE,

	teacher_id INTEGER NOT NULL
		REFERENCES teachers(teacher_id),

	course_name VARCHAR(250) NOT NULL,
	course_credits DECIMAL(12,2) NOT NULL
		CHECK (course_credits >= 0),
	course_semester INTEGER NOT NULL
		CHECK (course_semester >= 0)
); 

CREATE TABLE inscriptions(
	inscription_id SERIAL PRIMARY KEY,

	student_id INTEGER NOT NULL
		REFERENCES students(student_id),

	course_id INTEGER NOT NULL
		REFERENCES courses(course_id),

	inscription_date DATE NOT NULL,
	final_grade NUMERIC
		CHECK (final_grade >= 0)
);
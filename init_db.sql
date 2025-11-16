-- Reset database school_portal
DROP DATABASE IF EXISTS school_portal_db;
CREATE DATABASE school_portal_db;
USE school_portal_db;

-- ================================
-- 🔐 USERS TABLE (Login Accounts)
-- ================================
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin', 'professor', 'student') NOT NULL
);

-- ================================
-- 👨‍🎓 STUDENTS TABLE
-- ================================
CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id VARCHAR(50) NOT NULL UNIQUE,
  full_name VARCHAR(150) NOT NULL,
  course VARCHAR(100),
  year_level INT,
  section VARCHAR(20)
);

-- ================================
-- 👨‍🏫 PROFESSORS TABLE
-- ================================
CREATE TABLE professors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id VARCHAR(50) NOT NULL UNIQUE,
  full_name VARCHAR(150) NOT NULL,
  department VARCHAR(100)
);

-- ================================
-- 📘 SUBJECTS TABLE
-- ================================
CREATE TABLE subjects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  subject_code VARCHAR(50) NOT NULL UNIQUE,
  description VARCHAR(200) NOT NULL,
  units INT NOT NULL
);

-- ================================
-- 📚 PROFESSOR SUBJECTS TABLE
-- (What each professor teaches)
-- ================================
CREATE TABLE professor_subjects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id VARCHAR(50) NOT NULL,
  subject_code VARCHAR(50) NOT NULL,
  section VARCHAR(20),
  school_year VARCHAR(20),
  semester ENUM('1st', '2nd', '3rd (Summer)'),
  FOREIGN KEY (professor_id) REFERENCES professors(professor_id),
  FOREIGN KEY (subject_code) REFERENCES subjects(subject_code)
);


-- ================================
-- 📝 ENROLLMENTS TABLE
-- (Links students → professor_subjects)
-- ================================
CREATE TABLE enrollments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id VARCHAR(50) NOT NULL,
  prof_subject_id INT NOT NULL,
  midterm_grade DECIMAL(5,2),
  final_grade DECIMAL(5,2),
  remarks VARCHAR(50),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (prof_subject_id) REFERENCES professor_subjects(id)
);

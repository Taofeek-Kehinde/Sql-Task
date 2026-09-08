CREATE DATABASE IF NOT EXISTS school_management;
USE school_management;

-- =========================================================================
-- SYSTEM 1: STAFF_MEETING SYSTEM (BCNF compliant)
-- =========================================================================

CREATE TABLE project_representative (
    project_name VARCHAR(100) NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (project_name)
);

CREATE TABLE project_meeting (
    project_name VARCHAR(100) NOT NULL,
    meeting_date DATE NOT NULL,
    PRIMARY KEY (project_name, meeting_date),
    CONSTRAINT fk_meeting_project 
        FOREIGN KEY (project_name) 
        REFERENCES project_representative(project_name)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- =========================================================================
-- SYSTEM 2: STUDENT SYSTEM (BCNF & 4NF compliant)
-- =========================================================================

CREATE TABLE room_tariff (
    room_type VARCHAR(50) NOT NULL,
    dorm_cost DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (room_type)
);

CREATE TABLE club_tariff (
    club VARCHAR(100) NOT NULL,
    club_cost DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (club)
);

CREATE TABLE student_base (
    student_number INT NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    dorm VARCHAR(100) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (student_number),
    CONSTRAINT fk_student_room 
        FOREIGN KEY (room_type) 
        REFERENCES room_tariff(room_type)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE TABLE student_club (
    student_number INT NOT NULL,
    club VARCHAR(100) NOT NULL,
    PRIMARY KEY (student_number, club),
    CONSTRAINT fk_student_club_student 
        FOREIGN KEY (student_number) 
        REFERENCES student_base(student_number)
        ON DELETE CASCADE,
    CONSTRAINT fk_student_club_tariff 
        FOREIGN KEY (club) 
        REFERENCES club_tariff(club)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE TABLE student_sibling (
    student_number INT NOT NULL,
    sibling_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (student_number, sibling_name),
    CONSTRAINT fk_student_sibling_student 
        FOREIGN KEY (student_number) 
        REFERENCES student_base(student_number)
        ON DELETE CASCADE
);

CREATE TABLE student_nickname (
    student_number INT NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    PRIMARY KEY (student_number, nickname),
    CONSTRAINT fk_student_nickname_student 
        FOREIGN KEY (student_number) 
        REFERENCES student_base(student_number)
        ON DELETE CASCADE
);

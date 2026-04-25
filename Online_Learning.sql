CREATE TABLE STUDENT_DET(
	stid INTEGER  primary key ,
	usn varchar(15) unique not null,
	st_name varchar(20) not null,
	section varchar(2)
);


CREATE TABLE INSTRUCTOR_DET(
	instructor_id INTEGER  primary key,
	facul_no int unique not null,
	facul_name varchar(20) not null
);




CREATE TABLE COURSES(
	cid INTEGER  primary key,
	course_name varchar(30) not null,
	instructor_id INT not null,
	foreign key (instructor_id) references INSTRUCTOR_DET(instructor_id)
);


CREATE TABLE MODULES(
	mid INTEGER  primary key,
	module_name text not null,
	cid int not null,
	foreign key (cid) references COURSES(cid)
);


CREATE TABLE LESSON(
	lid INTEGER  primary key,
	lesson_name text not null,
	mid int not null,
	foreign key (mid) references MODULES(mid)
);


CREATE TABLE ENROLLMENT(
	stid int not null,
	cid int not null,
	primary key(stid,cid),
	foreign key (stid) references STUDENT_DET(stid),
	foreign key (cid) references COURSES(cid)
);



CREATE TABLE REVIEWS(
	rid INTEGER  primary key,
	cid int not null,
	stid int not null,
	ratings varchar(5) not null,
	review text not null,
	unique(cid,stid),
	foreign key (cid) references COURSES(cid),
	foreign key (stid) references STUDENT_DET(stid)	
);


CREATE TABLE PROGRESS(
	lid INT NOT NULL,
	stid int not null,
	primary key(lid,stid),
	foreign key (stid) references STUDENT_DET(stid),
	foreign key (lid) references LESSON(lid)
);


CREATE TABLE TAGS(
	tid INTEGER  primary key,
	tags_name VARCHAR(20) not null
);



CREATE TABLE COURSE_TAGS(
	cid int not null,
	tid int not null,
	primary key(cid,tid),
	foreign key (cid) references COURSES(cid),
	foreign key (tid) references TAGS(tid)
);





INSERT INTO INSTRUCTOR_DET(facul_no, facul_name) VALUES
(101, 'Dr. Sharma'),
(102, 'Prof. Mehta'),
(103, 'Dr. Rao');



INSERT INTO STUDENT_DET(usn, st_name, section) VALUES
('1RV21CS001', 'Aman', 'A'),
('1RV21CS002', 'Priya', 'A'),
('1RV21CS003', 'Rahul', 'B');


INSERT INTO COURSES(course_name, instructor_id) VALUES
('Web Development', 1),
('Machine Learning', 2),
('Database Systems', 3);


INSERT INTO MODULES(module_name, cid) VALUES
('HTML & CSS', 1),
('JavaScript Basics', 1),
('ML Basics', 2),
('Supervised Learning', 2),
('SQL Fundamentals', 3);


INSERT INTO LESSON(lesson_name, mid) VALUES
('Introduction to HTML', 1),
('CSS Styling', 1),
('JS Variables', 2),
('Linear Regression', 3),
('Decision Trees', 4),
('Basic Queries', 5);



INSERT INTO ENROLLMENT(stid, cid) VALUES
(1,1),
(1,2),
(2,1),
(2,3),
(3,2);



INSERT INTO REVIEWS(cid, stid, ratings, review) VALUES
(1,1,'5','Excellent course'),
(2,1,'4','Very informative'),
(1,2,'5','Loved it'),
(3,2,'3','Average'),
(2,3,'4','Good content');


INSERT INTO PROGRESS(lid, stid) VALUES
(1,1),
(2,1),
(3,1),
(1,2),
(6,2),
(4,3);



INSERT INTO TAGS(tags_name) VALUES
('Web Dev'),
('AI'),
('Database'),
('Programming');


INSERT INTO COURSE_TAGS(cid, tid) VALUES
(1,1),
(1,4),
(2,2),
(2,4),
(3,3);


select * from STUDENT_DET;


DROP TABLE IF EXISTS COURSE_TAGS;
DROP TABLE IF EXISTS TAGS;

DROP TABLE IF EXISTS PROGRESS;

DROP TABLE IF EXISTS REVIEWS;

DROP TABLE IF EXISTS ENROLLMENT;

DROP TABLE IF EXISTS LESSON;

DROP TABLE IF EXISTS MODULES;

DROP TABLE IF EXISTS COURSES;

DROP TABLE IF EXISTS STUDENT_DET;

DROP TABLE IF EXISTS INSTRUCTOR_DET;

SELECT s.stid, s.st_name,s.usn,s.section,c.course_name,c.instructor_id
FROM STUDENT_DET s
JOIN ENROLLMENT e ON s.stid==e.stid
JOIN COURSES c ON e.cid==c.cid;




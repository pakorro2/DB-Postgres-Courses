CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role_id" int
);

CREATE TABLE "course_users" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid,
  "progress_course" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level" varchar,
  "teacher_id" uuid
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "course_id" uuid
);

CREATE TABLE "categorie_courses" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid,
  "category_id" int
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "sub_category_id" int
);

CREATE TABLE "sub_categories" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "topic" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "categorie_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "categorie_courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "course_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "course_users" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("sub_category_id") REFERENCES "sub_categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");


INSERT INTO roles ( name) VALUES ('admin'),  ('student'),  ('teacher');

INSERT INTO users (
	id, 
	name, 
	email, 
	"password",
	age,
	role_id
) VALUES (
	'9ddc4885-e8c7-474b-a0b5-197c0a8a87a9', 
	'Pako Cárdenas', 
	'pakorro2@gmail.com', 
	'contra124',
	36,
	2
), (
	'549d7c0a-7156-4829-9241-74e09710dbee', 
	'Jhon Doe', 
	'jhon@mail.com', 
	'1234jhon',
	24,
	3
), (
	'a408d369-9068-43a9-87fe-35d534acc991', 
	'Pedro Muriarty', 
	'pedro2@coursera.com', 
	'contra1234',
	31,
	4
);

INSERT INTO course (
	id, 
	title, 
	description, 
	level,
	teacher_id
) VALUES (
	'b9f15964-3831-4655-b8ef-fe91c645aca7',
  'Professional Javascript Course 2022', 
	'Welcome to the professional Javascript course 2020-2021. In this course you will learn all the bases to work with the programming language on the client side. You will learn from the basic parts of Javascript to advanced topics such as object handling, classes, asynchrony, browser APIs and the use of features from ECMAScript 6 forward.', 
	'advanced', 
	'a408d369-9068-43a9-87fe-35d534acc991'
), (
	'881a59d0-b690-4ed1-a01b-0b5ddf9c679a',
  'Basic course of Video Editing with Adobe Premiere', 
	'In this course we will get to know the Adobe Premiere interface, we will learn to import and organize our files, we will make use of the main tools offered by this professional video editing software, we will apply effects and audio and video transitions in our editions, we will learn to control them , and finally we will perform the processing or rendering of the material created within this platform.', 
	'beginners', 
	'a408d369-9068-43a9-87fe-35d534acc991'
),(
	'66daef36-73fa-45ae-90af-849f3100b301',
  'Modern React with Redux',
	'Thousands of other engineers have learned React and Redux, and you can too.  This course uses a time-tested, battle-proven method to make sure you understand exactly how React and Redux work, and will get you a new job working as a software engineer or help you build that app youve always been dreaming about.', 
	'intermediate', 
	'a408d369-9068-43a9-87fe-35d534acc991'
);

INSERT INTO sub_categories (
name,
topic 
) VALUES (
'Programming languages',
'JavaScript'
),  (
'Web development',
'reactJS'
),  (
'Design, others',
'Adobe Premiere'
);

INSERT INTO course_videos (
id,
title,
url,
course_id 
) VALUES (
'25040526-5234-4d55-a73c-e9336688eea4',
'JavaScript fundamentals, primitives, arrays, objects and basic functions',
'https://www.courserademlo.com/course/professional-Javascript-2022/',
'b9f15964-3831-4655-b8ef-fe91c645aca7'
),(
'588dda92-e8b0-4db2-8a8e-93e825b7a6da',
'Basic course in video editing with adobe premiere cc',
'https://www.courserademlo.com/basic-edition-video-adobe-premiere-cc/',
'881a59d0-b690-4ed1-a01b-0b5ddf9c679a'
),(
'cfa0c391-9c30-4e7c-9a25-b2d8e1ffa309',
'Building Content with JSX',
'https://www.courserademlo.com/course/react-redux/',
'66daef36-73fa-45ae-90af-849f3100b301'
);

INSERT INTO course_users (
id,
user_id,
course_id,
progress_course
) VALUES (
'78f7ffb0-1a92-4b2b-a4fa-8b2a01b54ee3',
'549d7c0a-7156-4829-9241-74e09710dbee',
'66daef36-73fa-45ae-90af-849f3100b301',
15
),(
'20e324ba-8df0-49f5-b8ba-bb03eb370c70',
'549d7c0a-7156-4829-9241-74e09710dbee',
'b9f15964-3831-4655-b8ef-fe91c645aca7',
75
);

INSERT INTO categories (
name,
sub_category_id
) VALUES (
'Design',
3
),(
'Developing',
1
),(
'Developing',
2
);

INSERT INTO categorie_courses (
id,
course_id,
category_id
) VALUES (
'a60d9236-7221-4d6c-822a-4fea544df994',
'b9f15964-3831-4655-b8ef-fe91c645aca7',
2
),(
'133ae047-11ff-42b2-9e82-078884fa489b',
'881a59d0-b690-4ed1-a01b-0b5ddf9c679a',
1
),(
'46c47286-6e29-40f1-9f25-a07df1413b18',
'66daef36-73fa-45ae-90af-849f3100b301',
3
);

SELECT * FROM courses INNER JOIN course_videos ON courses.id = course_videos.course_id;
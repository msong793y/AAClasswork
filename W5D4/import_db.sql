PRAGMA foreign_keys = ON;

DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE question_like;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  fname character varying(50),
  lname character varying(50)

);

CREATE TABLE questions(
  id SERIAL PRIMARY KEY,
  title VARCHAR (255) NOT NULL,
  body VARCHAR (555) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id)
);


CREATE TABLE question_follows(
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id SERIAL PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body VARCHAR(1000),
  parent_id INTEGER,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id)

);

CREATE TABLE question_like(
  id SERIAL PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id)

);






INSERT INTO
users(id,fname,lname)
VALUES
(1,'Miles', 'Song'),
(2,'Han', 'Solo'),
(3,'Claw', 'Parker'),
(4,'Youngjun', 'Na');

INSERT INTO
questions(id,title, body, author_id)
VALUES
(1,'How is it going?', 'lorem ip sum',1),
(2,'WHATS GOING ON?', 'lorem ip sum',2),
(3,'IS IT LONELY OUT THERE?', 'lorem ip sum', 3);
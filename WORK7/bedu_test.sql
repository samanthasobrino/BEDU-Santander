CREATE DATABASE IF NOT EXISTS bedu_test;
USE bedu_test;

CREATE TABLE users (
id INT PRIMARY KEY,
genero CHAR(1),
edad INT,
ocupacion INT,
cp VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS movies (
   id INT PRIMARY KEY, 
   title VARCHAR(100), 
   generos VARCHAR(80)
); 

CREATE TABLE IF NOT EXISTS ratings (
   id_user INT, 
   id_movie INT, 
   rating INT, 
   fecha BIGINT,
   FOREIGN KEY (id_user) REFERENCES users(id),
   FOREIGN KEY (id_movie) REFERENCES movies(id)
);


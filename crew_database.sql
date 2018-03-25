DROP DATABASE IF EXISTS crew_database;
/* Creating database in this case crew_database */
CREATE database crew_database;
/* Use created database */
USE crew_database;

/* Creating three table, in this case member, aircraft and member_aircraft */

/* Creating first table with four arguments */
CREATE table member(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);

/* Creating second table with two arguments */
CREATE table aircraft(
    id INT NOT NULL AUTO_INCREMENT,
    model VARCHAR(32) NOT NULL,
    PRIMARY KEY (id)
);

/* Creating third table which is connection of first and second table, this table has four argumment */
CREATE table member_aircraft(
    id INT NOT NULL AUTO_INCREMENT,
    member_id INT NOT NULL,
    aircraft_id INT NOT NULL,
    assigned DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(id)
);

/* Fill database with some data */

INSERT INTO member(first_name, last_name, age) VALUES("Jack", "Rotman", 45);
INSERT INTO member(first_name, last_name, age) VALUES("Mark", "Key", 56);
INSERT INTO member(first_name, last_name, age) VALUES("John", "Drinkwater", 39);
INSERT INTO member(first_name, last_name, age) VALUES("Mich", "Forman", 35);
INSERT INTO member(first_name, last_name, age) VALUES("Michael", "Lotto", 42);
INSERT INTO member(first_name, last_name, age) VALUES("Gregory", "House", 60);

INSERT INTO aircraft(model) VALUES("Boeing 747");
INSERT INTO aircraft(model) VALUES ('Airbus');
INSERT INTO aircraft(model) VALUES ('F-16');
INSERT INTO aircraft(model) VALUES ('Concord');

INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(1, 1, CURDATE() -1);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(1, 1, CURDATE() -5);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(1, 2, CURDATE() -7);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(1, 1, CURDATE());
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(2, 2, CURDATE() -1);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(2, 4, CURDATE() -5);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(2, 4, CURDATE() -7);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(2, 4, CURDATE());
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(3, 4, CURDATE() -1);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(3, 4, CURDATE() -3);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(4, 2, CURDATE() -10);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(4, 2, CURDATE() -15);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(4, 2, CURDATE() -20);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(5, 1, CURDATE() -10);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(5, 2, CURDATE() -1);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(5, 2, CURDATE());
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(6, 3, CURDATE());
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(6, 3, CURDATE() -1);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(6, 3, CURDATE() -2);
INSERT INTO member_aircraft(member_id, aircraft_id, assigned) VALUES(6, 3, CURDATE() -3);

/* Find some results using queries */
/* Find oldest member */
SELECT first_name, last_name FROM member WHERE age = (SELECT MAX(age) FROM member);
/* Find fourth oldest member */
SELECT first_name, last_name FROM member ORDER BY age DESC LIMIT 1 OFFSET 3;
/* Find most experianced member */
SELECT first_name, last_name FROM member ORDER BY (SELECT COUNT(member_id) FROM member_aircraft WHERE member_id = member.id) DESC LIMIT 1;
/* Find least experianced member */
SELECT first_name, last_name FROM member ORDER BY (SELECT COUNT(member_id) FROM member_aircraft WHERE member_id = member.id) LIMIT 1;
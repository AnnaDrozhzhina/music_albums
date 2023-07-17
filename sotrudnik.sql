CREATE TABLE  IF NOT EXISTS department
(
	id_department SERIAL PRIMARY KEY,
	name_of_department VARCHAR(40) NOT NULL
);
CREATE TABLE  IF NOT EXISTS employer
(
	id_employer SERIAL PRIMARY KEY,
	name_of_employer VARCHAR(40) NOT NULL,
	id_department INTEGER REFERENCES department(id_department),
	id_boss INTEGER REFERENCES employer(id_employer)
);
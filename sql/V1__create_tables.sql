CREATE TABLE contact (
	id_contact SERIAL PRIMARY KEY NOT NULL,
	phone_number VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL
);

CREATE TABLE passenger (
	id_passenger SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	surname VARCHAR(45) NOT NULL,
	id_contact INT NOT NULL,
	FOREIGN KEY (id_contact) REFERENCES contact
);
CREATE TABLE luggage(
	id_luggage SERIAL PRIMARY KEY NOT NULL,
	weight FLOAT NOT NULL,
	id_passenger INT NOT NULL,
	FOREIGN KEY (id_passenger) REFERENCES passenger
);
CREATE TABLE address(
	id_address SERIAL PRIMARY KEY NOT NULL,
	country VARCHAR(45),
	city VARCHAR(45),
	street VARCHAR(45),
	house_number VARCHAR(45),
	postal_code VARCHAR(45)
);
CREATE TABLE passenger_has_addres(
	id_address INT NOT NULL,
	id_passenger INT NOT NULL,
	FOREIGN KEY (id_address) REFERENCES address,
	FOREIGN KEY (id_passenger) REFERENCES passenger
);
CREATE TABLE employee_type(
	id_employee_type SERIAL PRIMARY KEY NOT NULL,
	possition VARCHAR(45) NOT NULL
);
CREATE TABLE employee(
	id_employee SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	surname VARCHAR(45) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(45) NOT NULL,
	id_employee_type INT NOT NULL,
	FOREIGN KEY (id_employee_type) REFERENCES employee_type
);
CREATE TABLE salary(
	id_salary SERIAL PRIMARY KEY NOT NULL,
	salary VARCHAR(45) NOT NULL,
	paid_at TIMESTAMP[5] NOT NULL,
	primary_account_number VARCHAR(45) NOT NULL,
	id_employee INT NOT NULL,
	FOREIGN KEY (id_employee) REFERENCES employee
);
CREATE TABLE ticket_type(
	id_ticket_type SERIAL PRIMARY KEY NOT NULL,
	"class" VARCHAR(45) NOT NULL,
    capacity INT NOT NULL,
	"cost" FLOAT NOT NULL
);
CREATE TABLE airline(
	id_airline SERIAL PRIMARY KEY NOT NULL,
	airline_name VARCHAR(45) NOT NULL
);
CREATE TABLE aircraft(
	id_aircraft SERIAL PRIMARY KEY NOT NULL,
	"type" VARCHAR(45) NOT NULL,
	manufacturer VARCHAR(45) NOT NULL,
	capacity INT NOT NULL
);
CREATE TABLE flight(
	id_flight SERIAL PRIMARY KEY NOT NULL,
	gate VARCHAR(45) NOT NULL,
	departure_time TIMESTAMP[5] NOT NULL,
	id_aircraft INT NOT NULL,
	FOREIGN KEY (id_aircraft) REFERENCES aircraft
);
CREATE TABLE flight_crew(
	id_flight INT NOT NULL,
	id_employee INT NOT NULL,
	FOREIGN KEY (id_flight) REFERENCES flight,
	FOREIGN KEY (id_employee) REFERENCES employee
);
CREATE TABLE ticket(
	id_passenger INT NOT NULL,
	id_ticket_type INT NOT NULL,
	id_flight INT NOT NULL,
	id_airline INT NOT NULL,
	FOREIGN KEY (id_passenger) REFERENCES passenger,
	FOREIGN KEY (id_ticket_type) REFERENCES ticket_type,
	FOREIGN KEY (id_flight) REFERENCES flight,
	FOREIGN KEY (id_airline) REFERENCES airline
);
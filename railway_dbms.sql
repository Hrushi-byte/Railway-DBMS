show  databases;
drop database railway;
create database railway;
use railway;

create table station(station_id int primary key,name varchar(255) not null);
insert into station values (1,'Howrah Junction'),
    (2,'New Delhi Railway Station'),
    (3,'Mumbai Chhatrapati Shivaji Terminus'),
    (4,'Chennai Central'),
    (5,'Kolkata Sealdah'),
    (6,'Bengaluru City Railway Station'),
    (7,'Hyderabad Deccan Railway Station'),
    (8,'Jaipur Junction'),
    (9,'Ahmedabad Junction'),
    (10,'Pune Junction');
    select*from station;
    
    drop table trains;
    create table trains( name varchar(255) not null,train_id int primary key,train_type varchar(50));
    INSERT INTO trains values ('Express Train', 200,'High-Speed'),
    ('Superfast Train ', 350,'Express'),
    ('Local Train ', 100,'Local'),
    ('Shatabdi Express ', 300,'High-Speed'),
    ('Duronto Express ', 850,'Freight'),
    ('Rajdhani Express ', 400,'Passenger'),
    ('Garib Rath ', 250,'InterCity'),
    ('Jan Shatabdi ', 700,'Metro'),
    ('Intercity Express ', 150,'Luxury'),
    ('Mail/Passenger Train ', 900,'Shuttle');
    select*from trains;
    
    drop table train_schedules;
    CREATE TABLE train_schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    train_id INT,
    station_id INT,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    FOREIGN KEY (train_id) REFERENCES trains(train_id),
    FOREIGN KEY (station_id) REFERENCES station(station_id)
);

INSERT INTO train_schedules (train_id, station_id, departure_time, arrival_time) VALUES
	(200, 1, '2023-10-20 08:00:00', '2023-10-20 10:00:00'),
    (350, 3, '2023-10-20 09:30:00', '2023-10-20 12:30:00'),
    (100, 5, '2023-10-20 11:15:00', '2023-10-20 13:45:00'),
    (300, 7, '2023-10-20 13:00:00', '2023-10-20 15:45:00'),
    (850, 2, '2023-10-20 15:30:00', '2023-10-20 18:15:00'),
    (400, 4, '2023-10-20 18:00:00', '2023-10-20 20:30:00'),
    (250, 6, '2023-10-20 20:45:00', '2023-10-20 23:00:00'),
    (700, 8, '2023-10-21 08:30:00', '2023-10-21 10:30:00'),
    (150, 10, '2023-10-21 10:45:00', '2023-10-21 12:45:00'),
    (900, 9, '2023-10-21 12:30:00', '2023-10-21 14:30:00');
    
    desc train_schedules;
    
    select*from train_schedules;
   
    drop table passenger;
    CREATE TABLE passenger(
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_no int not null
);
  INSERT INTO passenger  VALUES
    (1,'John Doe', 'Male', '1990-05-15',123-456-7890),
    (2,'Alice Smith', 'Female', '1995-02-20',555-555-5555),
    (3,'Bob Johnson', 'Male', '1988-09-10',987-654-3210),
    (4,'Linda Brown', 'Female', '1987-12-03',111-222-3333),
    (5,'David Lee', 'Male', '1992-07-28',555-123-4567),
    (6,'Emily Davis', 'Female', '1998-04-17',999-888-7777),
    (7,'Michael Wilson', 'Male', '1985-11-19',777-888-9999),
    (8,'Sarah Taylor', 'Female', '1994-03-25',444-333-2222),
    (9,'William Clark', 'Male', '1991-06-12',123-789-4560),
    (10,'Olivia Lewis', 'Female', '1989-08-09',666-777-8888);
    select*from  passenger;
    
    
    drop table reservations;
    CREATE TABLE reservations (
    reservation_id INT ,
    passenger_id INT,
    train_id INT,
    schedule_id INT,
    seat_number INT,
    reservation_time DATETIME NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);
INSERT INTO reservations (passenger_id, train_id,seat_number, reservation_time) VALUES
    (1, 200, 15, '2023-10-20 09:00:00'),
    (2, 350, 7, '2023-10-20 09:30:00'),
    (3, 100, 3, '2023-10-20 10:15:00'),
    (4, 300, 12, '2023-10-20 11:00:00'),
    (5, 850, 8, '2023-10-20 12:30:00'),
    (6, 400, 2, '2023-10-20 14:00:00'),
    (7, 250, 17, '2023-10-20 15:45:00'),
    (8, 700, 5, '2023-10-20 17:30:00'),
    (9, 150, 20, '2023-10-20 19:15:00'),
    (10,900, 1, '2023-10-20 20:45:00');
    
    
    select*from station;
    select*from trains;
    select*from train_schedules;
    select*from passengers;
    select*from reservations;
    
    
    SELECT
    train_schedules.schedule_id,
    trains.name,
    station.name,
    train_schedules.departure_time,
    train_schedules.arrival_time
FROM
    train_schedules
INNER JOIN trains ON train_schedules.train_id = trains.train_id
INNER JOIN station ON train_schedules.station_id = station.station_id;


SELECT name AS name FROM trains
UNION
SELECT name AS name FROM station;


SELECT train_id, COUNT(*) AS total_reservations
FROM reservations
GROUP BY train_id;


SELECT *
FROM train_schedules
WHERE departure_time BETWEEN '2023-10-20 00:00:00' AND '2023-10-25 23:59:59';


CREATE VIEW train_schedule_view AS
SELECT
    ts.schedule_id,
    t.name,
    ts.departure_time,
    ts.arrival_time
FROM train_schedules ts
JOIN trains t ON ts.train_id = t.train_id
JOIN station s ON ts.station_id = s.station_id;
 select*from train_schedule_view;
 
 SELECT trains.train_id, trains.name, station.name
FROM trains
LEFT JOIN station ON trains.station_id = station.station_id
UNION ALL
SELECT trains.train_id, trains.name, station.name
FROM trains
RIGHT JOIN station ON trains.station_id = station.station_id
WHERE trains.train_id IS NULL;

select*from railway;
 
			/*thank you ----404*/








    

    

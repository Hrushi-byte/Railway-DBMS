# 🚆 Railway Database Management System (DBMS | MySQL)

A MySQL-based relational database system simulating core operations of a railway network, including management of trains, stations, schedules, passengers, and reservations. This project demonstrates database normalization, referential integrity, and advanced SQL querying.

## 📌 Features

- Normalized schema design with 10+ interrelated entities
- Realistic data for stations, trains, schedules, and passengers
- Complex SQL queries using `JOIN`, `UNION`, `GROUP BY`, and `VIEWS`
- Reservation analytics and schedule-based reports
- Indexing for optimized query performance

## 🛠️ Technologies Used

- MySQL  
- SQL Queries (DDL + DML)  
- MySQL Workbench / phpMyAdmin (recommended for testing)

## 🗃️ Database Schema

- `station(station_id, name)`
- `trains(train_id, name, train_type)`
- `train_schedules(schedule_id, train_id, station_id, arrival_time, departure_time)`
- `passenger(passenger_id, name, gender, dob, phone_no)`
- `reservations(reservation_id, passenger_id, train_id, schedule_id, seat_number, reservation_time)`

> Primary and foreign key constraints are enforced to maintain referential integrity.

## 📈 Sample Queries

```sql
-- Get all trains passing through a specific station
SELECT t.name, s.name AS station, ts.arrival_time, ts.departure_time
FROM train_schedules ts
JOIN trains t ON ts.train_id = t.train_id
JOIN station s ON ts.station_id = s.station_id
WHERE s.name = 'Mumbai Chhatrapati Shivaji Terminus';

-- Count total reservations per train
SELECT train_id, COUNT(*) AS total_reservations
FROM reservations
GROUP BY train_id;

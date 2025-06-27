# 📄 Documentation: Task 4 – Aggregate Functions and Grouping

## ✅ Objective
The goal of this task is to **analyze data** using SQL aggregate functions (`COUNT`, `SUM`, `AVG`) along with **grouping (`GROUP BY`)** and **filtering groups (`HAVING`)** to derive meaningful insights from the Airline Reservation System database.

## 🛠 Tools Used
- **MySQL Workbench**

## 📚 Concepts Used
- **Aggregate Functions**: `SUM()`, `COUNT()`, `AVG()`
- **Grouping**: `GROUP BY`
- **Group Filtering**: `HAVING`
- **Conditional Aggregation**

## 🗃️ Database Tables Used
- `Passengers(PassengerID, Name, Email, Phone)`
- `Airlines(AirlineID, Name)`
- `Flights(FlightID, FlightNumber, DepartureTime, ArrivalTime, AirlineID)`
- `Bookings(BookingID, PassengerID, FlightID, BookingDate)`

## 🔍 Queries & Descriptions

### 1. Total Bookings per Flight
```sql
SELECT FlightID, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY FlightID;
```

### 2. Total Passengers per Airline
```sql
SELECT A.Name AS Airline, COUNT(B.BookingID) AS TotalPassengers
FROM Airlines A
JOIN Flights F ON A.AirlineID = F.AirlineID
JOIN Bookings B ON F.FlightID = B.FlightID
GROUP BY A.Name;
```

### 3. Average Number of Bookings per Flight
```sql
SELECT FlightID, AVG(Total) AS AvgBookings
FROM (
    SELECT FlightID, COUNT(*) AS Total
    FROM Bookings
    GROUP BY FlightID
) AS Sub;
```

### 4. Flights with More Than 1 Booking
```sql
SELECT FlightID, COUNT(*) AS BookingCount
FROM Bookings
GROUP BY FlightID
HAVING COUNT(*) > 1;
```

### 5. Passenger Phone Number Summary
```sql
SELECT 
    CASE 
        WHEN Phone IS NULL THEN 'No Phone' 
        ELSE 'Has Phone' 
    END AS PhoneStatus,
    COUNT(*) AS PassengerCount
FROM Passengers
GROUP BY PhoneStatus;
```

### 6. Total Bookings per Date
```sql
SELECT BookingDate, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY BookingDate;
```

## 🎯 Learning Outcome
- Mastered how to summarize and analyze relational data using:
  - Aggregation functions
  - Grouping logic
  - Subqueries and conditional logic
- Able to derive business insights (e.g., busiest flights, passenger behavior) from raw data.

## 📌 Notes
- Ensure data integrity with proper `JOIN` conditions.
- Always validate results with sample data to ensure correctness.
- `HAVING` is used **after** aggregation, unlike `WHERE`.

## Outcome
- Ability to summarize and analyze tabular data using Aggregation functions.

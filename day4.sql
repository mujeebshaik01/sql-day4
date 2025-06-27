-- 1. Sum function
SELECT SUM(TotalBookings) AS TotalBookingsAcrossAllFlights
FROM (
    SELECT COUNT(*) AS TotalBookings
    FROM Bookings
    GROUP BY FlightID
) AS Sub;

-- 2. Count function
SELECT FlightID, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY FlightID;

-- 3. Count function
SELECT A.Name AS Airline, COUNT(B.BookingID) AS TotalPassengers
FROM Airlines A
JOIN Flights F ON A.AirlineID = F.AirlineID
JOIN Bookings B ON F.FlightID = B.FlightID
GROUP BY A.Name;


-- 4. Average function
SELECT  AVG(Total) AS AvgBookings
FROM (
    SELECT COUNT(*) AS Total
    FROM Bookings
    GROUP BY FlightID
) AS Sub;


-- 5. Flights with more than 1 booking (using HAVING)
SELECT FlightID, COUNT(*) AS BookingCount
FROM Bookings
GROUP BY FlightID
HAVING COUNT(*) > 1;


-- 6. Number of passengers with and without phone numbers
SELECT 
    CASE 
        WHEN Phone IS NULL THEN 'No Phone' 
        ELSE 'Has Phone' 
    END AS PhoneStatus,
    COUNT(*) AS PassengerCount
FROM Passengers
GROUP BY PhoneStatus;


-- 7. Total bookings per date
SELECT  COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY BookingDate;
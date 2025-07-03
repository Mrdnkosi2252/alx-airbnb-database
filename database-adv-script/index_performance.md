# Index Performance Analysis for alx-airbnb-database



## Identified High-Usage Columns
- **User**: `user_id` (joins, subqueries), `email` (lookups)
- **Booking**: `user_id` (joins, subqueries), `property_id` (joins), `start_date` (filtering/sorting)
- **Property**: `property_id` (joins, subqueries), `location` (searching)

## Index Creation
Indexes were defined in `database_index.sql` with the following commands:
- `CREATE INDEX idx_user_id ON User(user_id);`
- `CREATE INDEX idx_user_email ON User(email);`
- `CREATE INDEX idx_booking_user_id ON Booking(user_id);`
- `CREATE INDEX idx_booking_property_id ON Booking(property_id);`
- `CREATE INDEX idx_booking_start_date ON Booking(start_date);`
- `CREATE INDEX idx_property_id ON Property(property_id);`
- `CREATE INDEX idx_property_location ON Property(location);`

## Performance Measurement
### Selected Query
The correlated subquery to find users with more than 3 bookings was chosen for analysis:
```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    User u
WHERE 
    (SELECT COUNT(*) 
     FROM Booking b 
     WHERE b.user_id = u.user_id) > 3;
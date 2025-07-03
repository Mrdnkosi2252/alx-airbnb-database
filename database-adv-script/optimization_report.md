# Query Optimization Report for alx-airbnb-database

## Overview
This report analyzes the performance of an initial complex query retrieving bookings with user, property, and payment details, and proposes a refactored version to improve efficiency. Performance was measured using `EXPLAIN` (or `EXPLAIN ANALYZE` if supported) before and after optimization.

## Initial Query
The initial query is saved in `perfomance.sql`:
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.amount,
    pay.payment_date
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
INNER JOIN 
    Payment pay ON b.booking_id = pay.booking_id;
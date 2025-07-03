# Database Performance Monitoring for alx-airbnb-database


## Monitored Queries
### Query 1: Users with > 3 Bookings
- **Original Query**:
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
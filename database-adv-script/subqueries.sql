-- 1. Non-Correlated Subquery
--  Find all properties where the average rating is greater than 4.0
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight
FROM 
    Property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id
        FROM 
            Review r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );
--  This is a non-correlated subquery. The inner query independently calculates the average rating for each property_id in the Review table, filtering for averages greater than 4.0 using HAVING. The outer query then matches these property_ids to return the full details of the properties.

-- 2. Correlated Subquery
--Find users who have made more than 3 bookings
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
-- This is a correlated subquery. The inner query counts the number of bookings for each user_id from the outer User table, executing once per row. The outer query filters for users with a booking count greater than 3.
-- 1. Aggregation Query
-- Find the total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
ORDER BY 
    total_bookings DESC;
-- ses a LEFT JOIN to include all users, even those with no bookings (total_bookings = 0). COUNT(b.booking_id) aggregates bookings per user, GROUP BY groups the results, and ORDER BY sorts by total bookings in descending order.

-- 2. Window Function Query
-- Rank properties based on the total number of bookings
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight
HAVING 
    COUNT(b.booking_id) > 0
ORDER BY 
    booking_rank;
-- uses a LEFT JOIN to link properties with bookings. COUNT(b.booking_id) calculates total bookings per property, grouped by property details. RANK() assigns a rank based on bookings in descending order, HAVING filters out properties with no bookings, and ORDER BY sorts by rank.
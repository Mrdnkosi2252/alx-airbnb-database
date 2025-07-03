-- Retrieve all bookings with the user details who made them
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;

-- Retrieve all properties with their reviews, including properties with no reviews
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    r.review_id,
    r.rating,
    r.comment
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id;

-- Retrieve all users and all bookings, including users with no bookings and bookings with no users
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM 
    User u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;
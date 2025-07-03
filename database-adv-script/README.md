# Advanced SQL Queries with Joins and Subqueries



## Files
- `joins_queries.sql`: SQL script with INNER JOIN, LEFT JOIN, FULL OUTER JOIN, and a MySQL workaround query.
- `subqueries.sql`: SQL script with non-correlated and correlated subquery examples.

## Queries


1. **INNER JOIN**: Retrieves all bookings with the user details who made them.
   - Tables: `Booking` and `User`
   - Purpose: Match bookings with user details.

2. **LEFT JOIN**: Retrieves all properties and their reviews, including properties with no reviews.
   - Tables: `Property` and `Review`
   - Purpose: Include all properties, even those without reviews.

3. **FULL OUTER JOIN**: Retrieves all users and all bookings, including users with no bookings and bookings with no users.
   - Tables: `User` and `Booking`
   - Purpose: Show all records regardless of matches.
   - Note: Use the MySQL workaround if your database does not support FULL OUTER JOIN.

### Task 1: Subqueries
1. **Non-Correlated Subquery**: Finds all properties where the average rating is greater than 4.0.
   - Tables: `Property` and `Review`
   - Purpose: Identify high-rated properties using an independent subquery.

2. **Correlated Subquery**: Finds users who have made more than 3 bookings.
   - Tables: `User` and `Booking`
   - Purpose: Filter users based on a row-dependent subquery count.

## Usage
- Execute the `.sql` scripts in a SQL environment (e.g., MySQL, PostgreSQL) after setting up the `airbnb` database.
- Verify results with the seed data. Example:
  - INNER JOIN: Should return 2 rows based on seed data.
  - LEFT JOIN: Should return all properties (2) with 0-2 reviews.
  - Non-Correlated: Should return properties with average ratings > 4.0 (e.g., 0-1 based on seed data).
  - Correlated: Should return users with > 3 bookings (e.g., 0 unless more data is added).


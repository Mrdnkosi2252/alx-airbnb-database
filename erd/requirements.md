# ERD Creation for Airbnb Database

## Objective
Create an Entity-Relationship Diagram (ERD) to visualize the database schema for an Airbnb-like system, ensuring clear representation of entities, attributes, and relationships.

## Tools Used
- Draw.io: Used to design and export the ERD visually.
- GitHub: For version control and submission of the ERD files.

## Entities and Attributes
The following entities and their attributes were identified based on the provided database specification:

- **Users**
  - `user_id` (UUID, Primary Key)
  - `first_name` (String)
  - `last_name` (String)
  - `email` (String, Unique)
  - `password_hash` (String)
  - `phone_number` (String)
  - `role` (Enum: guest, host, admin)
  - `created_at` (Timestamp)

- **Properties**
  - `property_id` (UUID, Primary Key)
  - `name` (String)
  - `description` (String)
  - `location` (String)
  - `price_per_night` (Decimal)
  - `updated_at` (Timestamp)
  - `host_id` (UUID, Foreign Key to Users)

- **Bookings**
  - `booking_id` (UUID, Primary Key)
  - `start_date` (Date)
  - `end_date` (Date)
  - `total_price` (Decimal)
  - `status` (Enum: pending, confirmed, canceled)
  - `created_at` (Timestamp)
  - `property_id` (UUID, Foreign Key to Properties)
  - `user_id` (UUID, Foreign Key to Users)

- **Payments**
  - `payment_id` (UUID, Primary Key)
  - `booking_id` (UUID, Foreign Key to Bookings)
  - `amount` (Decimal)
  - `payment_date` (Timestamp)
  - `payment_method` (Enum: credit_card, paypal, stripe)

- **Reviews**
  - `review_id` (UUID, Primary Key)
  - `rating` (Integer, 1-5)
  - `comment` (String)
  - `created_at` (Timestamp)
  - `property_id` (UUID, Foreign Key to Properties)
  - `user_id` (UUID, Foreign Key to Users)

- **Messages**
  - `message_id` (UUID, Primary Key)
  - `sender_id` (UUID, Foreign Key to Users)
  - `recipient_id` (UUID, Foreign Key to Users)
  - `message_body` (String)
  - `sent_at` (Timestamp)

## Relationships
The following relationships were defined between entities:

- **Users to Properties**: One-to-Many (A user can host multiple properties; each property has one host via `host_id`).
- **Users to Bookings**: One-to-Many (A user can make multiple bookings; each booking is associated with one user via `user_id`).
- **Properties to Bookings**: One-to-Many (A property can have multiple bookings; each booking is tied to one property via `property_id`).
- **Bookings to Payments**: One-to-Many (A booking can have multiple payments; each payment is linked to one booking via `booking_id`).
- **Properties to Reviews**: One-to-Many (A property can have multiple reviews; each review is tied to one property via `property_id`).
- **Users to Reviews**: One-to-Many (A user can write multiple reviews; each review is tied to one user via `user_id`).
- **Users to Messages**: Many-to-Many (A user can send messages to and receive messages from multiple users; represented via `sender_id` and `recipient_id` foreign keys).

## Steps
1. Identified all entities and their attributes from the provided database specification.
2. Defined the relationships between entities with appropriate cardinalities (1:N or N:M where applicable).
3. Used Draw.io to create a visual ERD, marking primary keys (e.g., `uuid pk`) and foreign keys (e.g., `uuid fk`).
4. Exported the ERD as `airbnb_erd.png` for submission.

## Constraints
- `email` in `Users` is unique.
- `rating` in `Reviews` is constrained to values between 1 and 5.
- Foreign key constraints ensure referential integrity (e.g., `host_id` references `user_id`).

## Output
- ERD file: `ERD/airbnb_erd.png`
- Documentation: This `requirements.md` file.


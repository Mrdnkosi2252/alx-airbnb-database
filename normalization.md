# ERD Creation for Airbnb Database

## Objective
Create an Entity-Relationship Diagram (ERD) to visualize the Airbnb-like database schema.

## Tools Used
- app.eraser.io: For creating the ERD.
- GitHub: For version control and submission.

## Entities and Attributes
- **Users**: `user_id` (UUID, PK), `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.
- **Properties**: `property_id` (UUID, PK), `name`, `description`, `location`, `pricepernight`, `updated_at`, `host_id` (UUID, FK).
- **Bookings**: `booking_id` (UUID, PK), `start_date`, `end_date`, `total_price`, `status`, `created_at`, `property_id` (UUID, FK), `user_id` (UUID, FK).
- **Payments**: `payment_id` (UUID, PK), `booking_id` (UUID, FK), `amount`, `payment_date`, `payment_method`.
- **Reviews**: `review_id` (UUID, PK), `rating`, `comment`, `created_at`, `property_id` (UUID, FK), `user_id` (UUID, FK).
- **Messages**: `message_id` (UUID, PK), `sender_id` (UUID, FK), `recipient_id` (UUID, FK), `message_body`, `sent_at`.

## Relationships
- **Users to Properties**: One-to-Many (via `host_id`).
- **Users to Bookings**: One-to-Many (via `user_id`).
- **Properties to Bookings**: One-to-Many (via `property_id`).
- **Bookings to Payments**: One-to-Many (via `booking_id`).
- **Properties to Reviews**: One-to-Many (via `property_id`).
- **Users to Reviews**: One-to-Many (via `user_id`).
- **Users to Messages**: Many-to-Many (via `sender_id` and `recipient_id`).

## Steps
1. Identified entities and attributes from the database specification.
2. Defined relationships with foreign keys.
3. Created the ERD in Draw.io, marking PKs and FKs.
4. Exported as `airbnb_erd.png`.

## Constraints
- `email` in `Users` is unique.
- `rating` in `Reviews` is constrained to 1-5.
- Foreign key constraints ensure referential integrity.

## Output
- ERD file: `ERD/airbnb_erd.png`
- Documentation: This `requirements.md` file.

-- Add a new author
INSERT INTO "authors" ("first_name", "last_name")
VALUES ('George', 'Orwell');

-- Add a new book
INSERT INTO "books" ("title", "author_id", "isbn", "published_date", "available_copies")
VALUES ('1984', 1, '9780451524935', '1949-06-08', 5);

-- Add a new borrower
INSERT INTO "borrowers" ("first_name", "last_name", "email", "phone_number")
VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890');

-- Add a new librarian
INSERT INTO "librarians" ("first_name", "last_name", "email")
VALUES ('John', 'Doe', 'john.doe@library.com');

-- Record a borrowing transaction
INSERT INTO "borrowing_records" ("borrower_id", "book_id", "status")
VALUES (1, 1, 'borrowed');

-- Find all books by a specific author
SELECT *
FROM "books"
WHERE "author_id" = (
    SELECT "id"
    FROM "authors"
    WHERE "first_name" = 'George' AND "last_name" = 'Orwell'
);

-- List all borrowing records for a borrower
SELECT *
FROM "borrowing_records"
WHERE "borrower_id" = (
    SELECT "id"
    FROM "borrowers"
    WHERE "first_name" = 'Alice' AND "last_name" = 'Johnson'
);

-- Update the status of a borrowing record to 'returned'
UPDATE "borrowing_records"
SET "status" = 'returned', "return_date" = CURRENT_DATE
WHERE "id" = 1;

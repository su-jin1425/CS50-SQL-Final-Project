-- Table to represent authors of books
CREATE TABLE "authors" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);

-- Table to represent books in the library
CREATE TABLE "books" (
    "id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL,
    "author_id" INTEGER NOT NULL,
    "isbn" TEXT NOT NULL UNIQUE,
    "published_date" DATE,
    "available_copies" INTEGER NOT NULL CHECK(available_copies >= 0),
    FOREIGN KEY("author_id") REFERENCES "authors"("id")
);

-- Table to represent borrowers of books
CREATE TABLE "borrowers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "phone_number" TEXT UNIQUE,
    "membership_date" DATE DEFAULT CURRENT_DATE
);

-- Table to represent librarians managing the system
CREATE TABLE "librarians" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE
);

-- Table to record borrowing transactions
CREATE TABLE "borrowing_records" (
    "id" INTEGER PRIMARY KEY,
    "borrower_id" INTEGER NOT NULL,
    "book_id" INTEGER NOT NULL,
    "borrowed_date" DATE NOT NULL DEFAULT CURRENT_DATE,
    "return_date" DATE,
    "status" TEXT NOT NULL CHECK(status IN ('borrowed', 'returned')),
    FOREIGN KEY("borrower_id") REFERENCES "borrowers"("id"),
    FOREIGN KEY("book_id") REFERENCES "books"("id")
);

-- Indexes to optimize searches
CREATE INDEX "author_name_search" ON "authors" ("first_name", "last_name");
CREATE INDEX "book_title_search" ON "books" ("title");
CREATE INDEX "borrower_name_search" ON "borrowers" ("first_name", "last_name");

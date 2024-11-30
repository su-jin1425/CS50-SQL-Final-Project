# **Design Document**

**By:** Sujith S
**Video Overview:** `<URL HERE>`

---

## **Scope**

The purpose of this database is to manage a library system, focusing on the following:

### **In Scope**
- Efficient organization of books and their associated authors.
- Tracking loan details, including loan dates, due dates, and return status.
- Querying book availability and generating library statistics (e.g., number of books per author).

### **Out of Scope**
- Detailed user management, such as borrower profiles.
- Managing library branches.
- Automated notifications for overdue books.

---

## **Functional Requirements**

### **Core Features**
- **Books:**
  - Users can view available books and their details (title, genre, author).
- **Loans:**
  - Users can record when a book is loaned or returned.
  - Overdue books can be identified through query analysis.

### **Excluded Features**
- **Reservations:** Users cannot reserve books.
- **Notifications:** Automatic reminders for overdue loans are not included.
- **Borrower Profiles:** Detailed borrower information cannot be managed.

---

## **Representation**

### **Entities**
- **Authors:**
  - Attributes: `id`, `name`, `nationality`
- **Books:**
  - Attributes: `id`, `title`, `genre`, `author_id`
- **Loans:**
  - Attributes: `id`, `book_id`, `loan_date`, `due_date`, `returned`

### **Data Types**
- `id`: Auto-incrementing integers for unique identification.
- `name`, `title`, `nationality`, `genre`: Variable-length strings for flexibility.
- `loan_date`, `due_date`: Date type for loan tracking.
- `returned`: Boolean to denote the loan's return status.

### **Constraints**
- Primary keys (`id`) for unique identification of records.
- Foreign keys enforce relationships:
  - `author_id` in the `books` table links to `authors`.
  - `book_id` in the `loans` table links to `books`.
- Mandatory attributes like `loan_date` and `due_date` ensure proper loan tracking.

---

## **Relationships**

- **Authors ↔ Books**:
  - A one-to-many relationship. One author can write many books, but each book is associated with only one author.

- **Books ↔ Loans**:
  - A one-to-many relationship. One book can have multiple loan records, but each loan references a single book.

![Entity Relationship Diagram](diagram.jpg)

---

## **Optimizations**

- **Indexes:**
  - Indexed the `book_id` column in the `loans` table to improve the speed of queries related to loan tracking.

- **Normalization:**
  - The schema is normalized to eliminate redundancy and ensure data consistency.

- **Constraints:**
  - Foreign keys ensure referential integrity between related tables.

---

## **Limitations**

- **Co-authored Books:**
  - The schema does not accommodate books written by multiple authors.

- **Editions:**
  - The database does not track different editions of the same book.

- **Scalability:**
  - Performance may degrade with very large datasets unless additional optimizations (e.g., indexes) are applied.

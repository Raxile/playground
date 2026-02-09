# 🛒 PostgreSQL E-Commerce SQL Practice (Exercises Only)

## 📌 Overview

This project is a hands-on SQL exercise designed to strengthen your understanding of:

* Table creation
* Constraints
* Relationships (Foreign Keys)
* CRUD operations
* Joins
* Aggregation
* Subqueries
* Real-world backend-style problems

⚠️ **Note:** This file contains only exercises. No solutions are provided.

---

# 🗂 Database Schema (You Must Create)

Create the following tables with proper constraints, primary keys, and foreign keys:

### 1️⃣ users  - done

Fields:

* id
* name
* email
* country
* created_at

---

### 2️⃣ products - done

Fields:

* id
* name
* category
* price
* stock

---

### 3️⃣ orders - done

Fields:

* id
* user_id (FK → users.id)
* order_date
* status (pending, shipped, delivered, cancelled)

---

### 4️⃣ order_items - done

Fields:

* id
* order_id (FK → orders.id)
* product_id (FK → products.id)
* quantity (> 0)
* price (> 0)

---

# 🎯 Practice Exercises

---

## 🟢 Level 1 – Basics 

1. Insert at least 5 users. - done
2. Insert at least 5 products. - done
3. Insert at least 10 orders. - done
4. Insert order_items for each order. - done
5. Find all users from India.  - done
6. Find products that cost more than 20000. - done
7. Get all orders placed in the last 7 days.  - done

---

## 🟡 Level 2 – Joins & Aggregation

8. Get all orders along with user name. - done
9. Calculate total amount for each order.
10. Calculate total money spent by each user.
11. Find top 3 users who spent the most money.

---

## 🔴 Level 3 – Advanced Queries

12. Find products that were never ordered.
13. Find users who never placed an order.
14. Find the most sold product (by total quantity).
15. Find the highest revenue generating product.
16. Find users who placed more than 3 orders.

---

## 🔥 Level 4 – Subqueries & Complex Logic

17. Find users whose total spending is greater than the average user spending.
18. Find the second highest spending user.
19. Delete cancelled orders older than 30 days.
20. Update product stock when an order is placed.
21. Find users who ordered every product in category 'Electronics'.

---

# 🧠 Bonus Challenge (Self Join)

Create an `employees` table with:

* id
* name
* manager_id (self reference)
* salary

Exercise:

* Find employees who earn more than their manager.

---

# 🏁 Recommended Approach

1. Design tables carefully.
2. Add proper constraints.
3. Insert realistic dummy data.
4. Solve exercises level by level.
5. Optimize queries.
6. Use `EXPLAIN` to analyze performance.

---

🔥 Complete all exercises and you will think like a backend engineer.

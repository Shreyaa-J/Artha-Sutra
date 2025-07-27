# 💼 Daily Expense Tracker

A JSP + Servlet-based web application to help users track expenses and plan their monthly budgets using MySQL.

---

## ✅ Features Implemented

1. 🔐 **User Registration and Login**
   - Secure user authentication using sessions.

2. 📊 **Dashboard Overview**
   - Displays total expenses and remaining balance summary.

3. 💸 **Expense Management**
   - Add and view expense entries with date and category.

4. 📅 **Date & Category Filters**
   - Filter expenses by selected month or category.

5. 📈 **Budget Planner**
   - Users input salary and savings goal.
   - System calculates total expense and remaining balance.
   - Budget data is saved monthly in the database.

6. 🧠 **Google Charts Visualization**
   - Pie chart to visualize expenses, savings, and remaining balance.

---

## 🛠️ Technologies Used

- **Java (JSP + Servlet)**
- **MySQL + JDBC**
- **HTML5, Bootstrap 5**
- **Google Charts**

---

## 🗃️ Database Tables

- `users`
- `expenses`
- `budget`

---

## 🏃 How to Run the Project

1. Import the project as a **Dynamic Web Project** in Eclipse/IntelliJ.
2. Set up MySQL and create tables (`users`, `expenses`, `budget`) as per schema.
3. Configure your DB credentials in `DBConnection.java`.
4. Run the project on Apache Tomcat server.
5. Open your browser and go to:

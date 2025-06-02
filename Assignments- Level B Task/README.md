# 📊 SQL Assignment - Level B | Internship Project

This repository contains a comprehensive SQL-based solution developed as part of my internship at **Celebal Technologies**. The project demonstrates proficiency in advanced SQL concepts including stored procedures, views, triggers, and functions using the **AdventureWorks** sample database.

---

## 🔍 Project Objective

The goal of this task is to design and implement key database components that simulate a real-world order management system. This includes dynamic order processing, inventory management, date formatting, and data visualization using views.

---

## 📂 Contents

| Component Type      | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| Stored Procedures   | Automate insert, update, fetch, and delete operations for order details     |
| Scalar Functions    | Format dates in specific MM-DD-YYYY and YYYYMMDD formats                   |
| Views               | Summarize customer orders and product metadata from multiple joined tables |
| Triggers            | Manage automatic record updates on deletion and ensure inventory accuracy  |

All components are written in standard T-SQL syntax and can be directly executed on the AdventureWorks database.

---

## 📌 Task Requirements

### 🛠️ Stored Procedures
- `InsertOrderDetails`: Handles dynamic pricing, inserts orders, and updates inventory.
- `UpdateOrderDetails`: Edits existing order details and adjusts inventory accordingly.
- `GetOrderDetails`: Fetches complete order info based on the given `OrderID`.
- `DeleteOrderDetails`: Deletes a specific order-product pair and returns meaningful messages.

### 📐 Functions
- `FormatDateMMDDYYYY(@date)`: Returns date in MM/DD/YYYY format.
- `FormatDateYYYYMMDD(@date)`: Returns date in YYYYMMDD format.

### 🧾 Views
- `vwCustomerOrders`: Shows customer orders with total price calculation.
- `vwCustomerOrdersYesterday`: Filters orders placed one day before the current date.
- `MyProducts`: Lists available products with vendor and category metadata.

### 🔁 Triggers
- `trgDeleteOrderDetails`: Automatically deletes associated order details before removing an order.
- `trgCheckInventory`: Ensures product quantity is not dropped below zero during insertion.

---


## 👤 Developer Information

This project was created by:

- **Name**: Dinesh Singh  
- **Intern ID**: CT_CSI_SQ_2090  
- **Email**: dsrawat117@gmail.com  

---


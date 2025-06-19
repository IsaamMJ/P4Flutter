# 🛠️ Maintenance Portal - Flutter App

This is a cross-platform **Flutter application** for managing maintenance operations such as work orders and notifications. It integrates with a **Node.js/Express backend** secured via **JWT authentication**.

---

## 📱 Features

- 🔐 **Login Authentication**
  - Uses JWT tokens stored in `SharedPreferences`
- 📊 **Dashboard**
  - Displays key metrics and navigation to modules
- 📥 **Work Orders**
  - Fetch SAP-style order data with proper date formatting
- 🔔 **Notifications**
  - View system alerts and SAP notifications
- 🌐 **Backend Communication**
  - Secure `POST` requests with token-based auth
- 📦 **Clean Architecture**
  - Follows `Domain → UseCase → Repository → Controller` structure
- 🎨 **Beautiful UI**
  - Responsive layout with `GoogleFonts`, `Lottie`, and custom styling
- 🚀 **State Management**
  - Powered by [GetX](https://pub.dev/packages/get)

---

## 🧾 Folder Structure

```

frontend/
├── 01login/
├── 02dashboard/
├── 03workorder/
├── 04notification/
├── controller/
├── data/
├── domain/
├── presentation/
├── routes/
└── main.dart

````

---

## 🔧 Installation

### ✅ Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Node.js Backend Server](https://nodejs.org/) (Must be running on `http://localhost:3000`)

### 🚀 Steps

```bash
git clone https://github.com/yourusername/maintenance-portal.git
cd maintenance-portal
flutter pub get
flutter run
````

---

## 🔐 Authentication

* Username and password are sent via `POST /api/login`
* Token is stored in `SharedPreferences` (`jwt_token`, `username`)
* Token is sent in the `Authorization` header for:

    * `/api/work-orders`
    * `/api/notification`

---

## ⚙️ Backend Integration

Ensure the backend is running and supports these routes:

| Endpoint            | Method | Auth Required | Description             |
| ------------------- | ------ | ------------- | ----------------------- |
| `/api/login`        | POST   | ❌             | User authentication     |
| `/api/work-orders`  | POST   | ✅             | Fetch work order data   |
| `/api/notification` | POST   | ✅             | Fetch notification data |

---




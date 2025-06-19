# Flutter Work Order Dashboard

This is a **Flutter application** that integrates with an **SAP backend** to fetch and display work order data based on an employee's ID. The application allows users to input an **Employee ID**, fetch related work orders, and display them in a clean, user-friendly layout.

---

## Features

* **Login Form**: User provides **Employee ID** and fetches work orders.
* **Dashboard**: Displays work order details including:

    * Order Number
    * Order Type
    * Order Description
    * Created On
    * Created By
    * Last Changed By
    * Company Code
    * Plant
    * Object Number
    * Routing Operation Number
    * Basic Start Date
    * Basic Finish Date
    * Activity Number
    * Operation Short Text
    * Work Centre
    * Employee ID
    * Notification Number
* **Loading Indicator**: Displays a loading spinner while fetching data.
* **Error Handling**: Displays appropriate messages if no work orders are found or if the API request fails.
* **Refresh Button**: Allows users to reload the work orders.
* **Smooth UI**: Designed with responsiveness and user experience in mind.

---

## Backend Integration

This app interacts with an **SAP OData** service. The backend API fetches work orders based on the **Employee ID** provided by the user. It uses **Basic Authentication** and returns work order details in **XML format**.

### API Endpoint

```
POST http://your-backend-url/api/workorders
```

The backend receives an **Employee ID** and returns the following fields for each work order:

* Order Number
* Order Type
* Order Description
* Created On
* Created By
* Last Changed By
* Company Code
* Plant
* Object Number
* Routing Operation Number
* Basic Start Date
* Basic Finish Date
* Activity Number
* Operation Short Text
* Work Centre
* Employee ID
* Notification Number

---

## Prerequisites

* **Flutter SDK** (version 3.x or above)
* **Dart SDK** (version 2.x or above)
* **Internet connection** for fetching work order data via the API

---

## Getting Started

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/your-username/flutter-work-order-dashboard.git
   cd flutter-work-order-dashboard
   ```

2. **Install Dependencies**:
   Run the following command to install the required packages:

   ```bash
   flutter pub get
   ```

3. **Setup Backend API**:

    * Ensure your backend API is running.
    * Configure the **SAP OData service** and replace the API URL in your Flutter code.
    * If the backend isn't available yet, use a mock API or Postman mock server to test the UI.

4. **Run the Application**:
   To run the app on your desired platform (e.g., Android/iOS/Chrome), use:

   ```bash
   flutter run
   ```

---

## Folder Structure

```
lib/
├── main.dart                # Entry point of the application
├── presentation/            # Contains UI pages and widgets
│   ├── pages/               # LoginPage, DashboardPage, etc.
│   └── widgets/             # Reusable UI components
├── controller/              # Logic for user interaction, data fetching
├── routes/                  # Routes for navigation
└── models/                  # Data models and structures
```

---

## Contributing

Feel free to fork this repository and submit pull requests. If you find any bugs or have suggestions for improvements, please open an issue.

---

### 🧑‍💻 **Created with ❤️ by \[Mohamed Isaam M J]**


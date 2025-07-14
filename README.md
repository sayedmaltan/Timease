# Timease

**Timease** is a robust scheduling and booking platform built to empower professionals with an intuitive and efficient time management solution. It enables users to create, manage, and book appointments seamlessly with a user-friendly interface and powerful backend services.

---

## 🧠 Features

- User Authentication & Role-based Authorization (JWT)
- Event & Meeting Scheduling
- Availability & Time Slot Management
- Notifications
- Admin Dashboard
- Mobile & Web Frontend (Flutter)
- PostgreSQL Integration
- Fully Containerized with Docker

---

## 📦 Project Structure

```bash
├── timease-backend      # Spring Boot backend
├── timease_mobile     # Flutter frontend
├── docker-compose.yml   # Multi-service orchestration
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- [Docker & Docker Compose](https://docs.docker.com/compose/)
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- (Optional) Java 17+ and PostgreSQL if you want to run backend locally

---

## 🐳 Running the Full Stack Using Docker Compose

In the root directory of the project, run:

```bash
docker-compose up --build
```

This will start the following services:

- **Backend**: [http://localhost:8080](http://localhost:8080)
- **PostgreSQL**: Port 5432

---

## ⚙️ Backend Environment Variables

These are set in the Docker Compose file:

```env
DB_HOST=db
DB_PORT=5432
DB_NAME=timease-db
DB_USERNAME=admin
DB_PASSWORD=admin
SECRET=A4C555AD9F7B2BADDC51EBDB5878345D6EF1234567890ABCDEF1234567890ABC
EXP=3600000
REFRESH_EXP=2592000000
```

---

## 🧪 API Documentation

Access full Swagger docs at:

➡️ [http://localhost:8080/swagger-ui/index.html](http://localhost:8080/swagger-ui/index.html)

---

## 🖥️ Running Flutter Frontend (Manually)

If you want to run the Flutter app outside Docker:

1. Navigate to the frontend folder:
   ```bash
   cd timease-frontend
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run -d chrome
   ```
   or use `-d android` / `-d ios` depending on the target.

---

## 🎥 Demo

A video demo showcasing the full functionality of Timease will be added here.

📺 

https://github.com/user-attachments/assets/7585ea68-42e4-46f1-82d1-11557ee0d1e9


---

## 🛠️ Technologies Used

- **Backend**: Spring Boot, PostgreSQL, JWT, Docker
- **Frontend**: Flutter (Web & Mobile)
- **DevOps**: Docker Compose, Railway (Deployment)

---

## 📂 Database

Uses PostgreSQL with the following credentials (in development):

```env
username: admin
password: admin
database: timease-db
```

---

## 📬 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m "Add my feature"`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License.

---

## 🙌 Acknowledgements

Developed as part of a graduation project by Eslam Samy, El-Sayed Ahmed, Ahmed Nassar, Mohammed Mustafa, Eslam Saleh.

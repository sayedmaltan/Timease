# Timease
#### Timease is built to empower professionals with an intuitive and robust scheduling solution that simplifies time management

# **Timease Backend API**

This API provides authentication, user management, and role-based authorization using JWT tokens. Below are the endpoints and usage instructions.

---
# **How to Run the Application**

To run the backend and database using Docker Compose, follow these steps:

1. **Go to The Timease Directory and run:**
2. 
   ```bash
   docker-compose up db backend
   ```
   Backend API will be available at http://localhost:8080

---
## **Authentication Endpoints**

### **1. Register a New User**
- **Endpoint:** `POST http://localhost:8080/api/v1/auth/signup`
- **Description:** Creates a new user with an email and password.
- **Request Body:**
  ```json
  {
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "password": "password123"
  }
  ```
 - **Response:**
  ```json
    {
      "message": "User registered successfully."
    }
```


## **2. Login a User**

- **Endpoint:** `POST http://localhost:8080/api/v1/auth/login`
- **Description:**  `Authenticates a user and returns a JWT token.`
- **Request Body:** 
```json
{
  "email": "john.doe@example.com",
  "password": "password123"
}
```

 - **Response:**
  ```json
{
     "accessToken": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0ZXJAdGVzdC50ZXN0IiwiaWF0IjoxNzMyNDc4NjEwLCJleHAiOjE3MzI0ODIyMTB9.QFTpWgNbCJN381euzDig5kBNrhHdX-pfo0QjMFdH6Ko",
     "refreshToken": "aef12345-refresh-token-67890",
     "type": "Bearer",
     "id": "75483ccc-fa34-4d7d-8b1c-575ddf0bf338",
     "email": "john.doe@example.com",
     "roles": [
         "ROLE_USER"
        ]
}

```
## **3.  Refresh Access Token**

- **Endpoint:** `POST http://localhost:8080/api/v1/auth/refresh-token`
- **Description:**  `Refreshes the access token using a valid refresh token.`
- **Request Body:** 
```json
{
  "refreshToken": "aef12345-refresh-token-67890"
}

```

 - **Response(Successful):**
  ```json
{
  "accessToken": "new-access-token",
  "refreshToken": "aef12345-refresh-token-67890",
  "type": "Bearer",
  "email": "john.doe@example.com"
}
```
- **Response(Expired or Invalid Refresh Token):**
  ```json
   {
     "message": "Error: Refresh token expired!"
   }
  ```

  
## **4.  Logout User**

- **Endpoint:** `PPOST http://localhost:8080/api/v1/auth/logout`
- **Description:**  ` Logs out the user by invalidating the refresh token.`
- **Request Body:** 
```json
{
  "refreshToken": "aef12345-refresh-token-67890"
}

```

 - **Response:**
  ```json
{
  "message": "User logged out successfully!"
}

```

# **Test**

 provides a simple endpoint to verify if the user is authenticated and fetch basic information about the logged-in user.


## **Endpoint**

### **1. Check Authentication**
- **Endpoint:** `GET http://localhost:8080/api/v1/auth/test/`
- **Description:** Verifies if the user is logged in and retrieves their username.
- **Headers:**
  ```json
  {
    "Authorization": "Bearer <JWT_TOKEN>"
  }
  ```

- **Response(User is Logged In):**
  ```json
    {
        "message": "You are logged in, Here is your info : <username>" 
    }
   ```
- **Response (User is Not Logged In):**
-  If The user is logged in
  ```json
   {
     "error": "Forbidden"
   }
```

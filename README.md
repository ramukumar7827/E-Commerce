# E-Commerce Mobile App
A full-featured Flutter-based e-commerce mobile application with Firebase backend integration and Razorpay payment gateway. Users can browse products, add them to cart, and complete payments securely.

---

## 🚀 Features

- Firebase Authentication (Email/Password)
- Add to Cart & Buy Now functionality
- Real-time product data using Cloud Firestore
- Razorpay payment gateway integration
- Order confirmation after successful payment
- GridView-based product display with image support
## 1️⃣ Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / VS Code
- Firebase Project
- Razorpay account

### Installation

bash
git clone https://github.com/your-username/ecom_app.git
cd ecom_app
flutter pub get
2️⃣ Firebase Setup
Create Firebase Project

Go to Firebase Console

Create a new project

Register your Android app

Use your app's package name (e.g., com.example.ecom_app)

Download google-services.json and place it in:

bash
Copy
Edit
android/app/google-services.json
Enable Authentication & Firestore

Go to Authentication → Sign-in Method → Enable Email/Password

Go to Firestore Database → Create database in test mode

Firebase SDK Integration

In android/build.gradle:

gradle
Copy
Edit
classpath 'com.google.gms:google-services:4.3.15'
In android/app/build.gradle:

gradle
Copy
Edit
apply plugin: 'com.google.gms.google-services'
3️⃣ Razorpay Integration
Create Razorpay Account

Dashboard

Generate Test API Key

Copy Key ID and use it in your payment code

Add Razorpay to pubspec.yaml

yaml
Copy
Edit
razorpay_flutter: ^1.3.4
Add Internet Permission
In AndroidManifest.xml:

xml
Copy
Edit
<uses-permission android:name="android.permission.INTERNET"/>
Test Payment Details

yaml
Copy
Edit
Card: 4111 1111 1111 1111
Expiry: Any future date
CVV: 123
OTP: 123456
4️⃣ Folder Structure
css
Copy
Edit
lib/
├── models/
│   └── product.dart
├── screens/
│   ├── home_screen.dart
│   ├── cart_screen.dart
│   └── profile_screen.dart
├── services/
│   └── user_service.dart
├── widgets/
│   └── my_appbar.dart
├── main.dart
5️⃣ How to Run
bash
Copy
Edit
flutter run
Make sure you are connected to an emulator or physical device.

6️⃣ Contribution
Feel free to fork and submit pull requests. Suggestions and feedback are welcome!

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

yaml
Copy
Edit









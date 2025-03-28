Smart Bill

Smart Bill is a mobile application designed to help users efficiently track their expenses and income. It features a receipt scanner powered by machine learning to simplify the process of logging transactions. The app provides users with a streamlined interface to manage financial records, offering insights into spending habits and budgeting.

Features

Secure Authentication: Utilizes Firebase Authentication to protect user data.

Comprehensive Dashboard: Displays total income, expenses, remaining budget, and transaction timelines.

Transaction Management: Allows users to manually add transactions or scan receipts using the camera roll.

Receipt Scanning: Uses Optical Character Recognition (OCR) through Google's Machine Learning Kit to extract receipt details.

Filtering Options: Enables users to filter transactions by income, expenses, and specific time periods.

Tech Stack

Swift: Used for developing the iOS mobile application.

TensorFlow & Google's ML Kit: Powers the receipt scanner with OCR capabilities.

Firebase: Handles user authentication and data security.

Getting Started

To run the project locally:

Clone the Repository

git clone [repository URL]

Navigate to the Project Directory

cd smart-bill

Install Dependencies

Open the project in Xcode and ensure all dependencies are resolved.

Set Up Firebase

Create a Firebase project.

Download the GoogleService-Info.plist file.

Add it to the project directory.

Run the Application

Build and run the app using Xcode on a simulator or physical device.

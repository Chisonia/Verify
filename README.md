# verify
Authors:
*Dr Chinenye Akukalia

*Ozioma Agaecheta

**Verify App**

Overview
Product Verification App. This app allows users to verify the authenticity of a product by cross-checking the NAFDAC number against a database. If the product is not registered with NAFDAC, the app notifies the user. Currently, the app uses an API with dummy data to simulate the verification process. Once approval is obtained from NAFDAC, it will be integrated with the official database.

**Features:**

Splash Screen: A loading screen displayed when the app is launched.

Onboarding Screens: Three screens introducing the app's functionality to new users.

Home Screen: The main hub of the app where users can navigate to perform product verification.

Decision Screen: Allows users to choose between snapping a barcode to retrieve the NAFDAC number or manually entering the number.

Verification Feature: Verifies the authenticity of a product and displays results.

**Setup Instructions**

Prerequisites:
-Ensure you have Flutter installed on your system.
-Install a code editor (e.g., Visual Studio Code).
-Clone the repository to your local machine:
    bash
    Copy
    Edit
    git clone <repository-url>  

Installation Steps:

-Navigate to the project folder:
    cd nafdac-verification-app 

-Install the required dependencies:

    flutter pub get  

-Run the app on a connected emulator or physical device:

    flutter run  

Usage Guidelines
Navigating the App:

Splash Screen: The app displays a loading screen when launched.

Onboarding Screens: New users are introduced to the app's features through three onboarding screens. Swipe to proceed.

Home Screen: Access the app’s main features, such as verifying a product.

Decision Screen: 
Choose between:
Scan Barcode: Use your camera to scan a barcode and retrieve the NAFDAC number.
Manual Entry: Input the NAFDAC number directly.

Verifying Products:

Enter the NAFDAC number and click the "Check" button.
The app checks the number against the dummy database:
If the product is verified, details are displayed.
If the product is unregistered, an error message is shown with suggestions for further action.

**Project Architecture**
The project follows the MVVM (Model-View-ViewModel) architectural pattern to ensure clean and scalable code.

**Folder Structure:**

lib/  
│  
├── screens/  
│   ├── splash_screen.dart       # Displays the loading screen  
│   ├── onboarding_screen.dart   # Contains onboarding screens  
│   ├── home_screen.dart         # Main hub of the app  
│   ├── decision_screen.dart     # Allows users to choose a verification method  
│   ├── manual_entry_page.dart   # Input NAFDAC number manually  
│   └── scan_barcode_page.dart   # Barcode scanning logic  
│  
├── widgets/  
│   └── common_widgets.dart      # Reusable UI components  
│  
├ 
│  
├ 
│  
├ 
│  
└── main.dart                    # App entry point  

API Simulation
Current API Logic:
The app uses a mock API that returns predefined results for specific NAFDAC numbers.

Success: Returns product details if the NAFDAC number exists in the dummy database.
Error: Displays a message and suggestions if the number is not found.
Example Dummy Data:
json

[  
{  
"productName": "Paracetamol 500mg",  
"nafdacNumber": "A56789",  
"manufacturer": {  
"name": "ABC Pharmaceuticals"  
}  
}  
]  


# API DOCUMENTATION
# Product Verification API

## Overview
This is a Flask-based API for verifying pharmaceutical products using their NAFDAC (National Agency for Food and Drug Administration and Control) numbers. The API provides endpoints to verify individual products and retrieve a list of all registered products.

## Features
- Product verification by NAFDAC number
- Retrieve all registered products
- SQLite database for product storage
- CORS support for web application integration

## Prerequisites
- Python 3.7+
- Flask
- Flask-CORS

## Installation

### 1. Clone the Repository
```bash
git clone <your-repository-url>
cd <repository-name>
```

### 2. Create a Virtual Environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Initialize Database
```bash
python bd.py  # Initializes the SQLite database with sample products
```

## Running the API
```bash
python app.py
```
The API will start running on `http://127.0.0.1:5000/`

## API Endpoints

### 1. Home Route
- **URL:** `/`
- **Method:** `GET`
- **Description:** Returns welcome message and available endpoints
- **Response:**
  ```json
  {
    "status": "success",
    "message": "Welcome to the Product Verification API",
    "endpoints": {
      "verify_product": "/api/verify-product/<nafdac_number>",
      "all_products": "/api/products"
    }
  }
  ```

### 2. Product Verification
- **URL:** `/api/verify-product/<nafdac_number>`
- **Method:** `GET`
- **Description:** Verify a product by its NAFDAC number
- **Success Response:**
  ```json
  {
    "status": "success",
    "message": "Product found and verified.",
    "product": {
      "productName": "Paracetamol 500mg",
      "nafdacNumber": "A5-6789",
      "manufacturer": {
        "name": "ABC Pharmaceuticals"
      }
    }
  }
  ```
- **Error Response (404):**
  ```json
  {
    "status": "error",
    "message": "Product not found in NAFDAC records."
  }
  ```

### 3. All Products
- **URL:** `/api/products`
- **Method:** `GET`
- **Description:** Retrieve all registered products
- **Response:**
  ```json
  {
    "status": "success",
    "products": [
      {
        "productName": "Paracetamol 500mg",
        "nafdacNumber": "A5-6789",
        "manufacturer": {
          "name": "ABC Pharmaceuticals"
        }
      },
      ...
    ]
  }
  ```

## Database Schema
- `id`: Primary key (auto-increment)
- `product_name`: Name of the pharmaceutical product
- `nafdac_number`: Unique NAFDAC registration number
- `manufacturer_name`: Name of the product manufacturer

## Error Handling
- 404 error for non-existent NAFDAC numbers
- Unique constraint on NAFDAC numbers

## Development
- Debug mode is enabled
- CORS is configured for all origins

## Testing
Use `test.db` to verify database contents:
```bash
python test.db
```

## Security Considerations
- Use in a secure network environment
- Consider adding authentication for production
- Implement input validation and sanitization



**Future Enhancements**

Integrate with NAFDAC’s official database for real-time verification.

Implement advanced analytics for tracking product verification trends.

Add multi-language support for broader accessibility.

Enable offline functionality to allow verification without internet access.
Contribution

We welcome contributions to improve the app. Please follow the steps below to contribute:

Fork the repository.
Create a new branch for your feature or bug fix:
git checkout -b feature-name  
Commit your changes:
git commit -m "Description of changes"  
Push to your branch:
git push origin feature-name  
Open a pull request on the main repository.
License
This project is licensed under the MIT License.


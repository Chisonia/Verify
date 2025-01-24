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


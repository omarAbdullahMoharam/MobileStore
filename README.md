Mobile Store Application

Overview

The Mobile Store Application is a feature-rich mobile app developed using Flutter. It provides users with an intuitive experience for browsing, purchasing, and managing mobile phones. It also includes administrative features for product management.


**Features**

  **User Authentication**
    Secure login and sign-up.
    Password recovery.
    Social media login options (Google, Facebook, etc.).

  **Product Browsing**
    Display of products with images, brand, model, price, and availability.
    Favorite and cart functionalities.
  
  **Admin Product Management**
    Add new products with name, price, and image.
    Data stored in a local SQLite database.
  
  **Cart Management**  
    Add or remove products from the cart.
    Persistent cart storage.

**Responsive Design**
    Optimized for various screen sizes, including the Pixel 7 Pro.
    Handles keyboard inputs gracefully to avoid layout issues.

**Technical Details**
  **Technologies Used**
    **Flutter**: For building the UI.
   **State Management**: Using flutter_bloc.
    **Local Database**: Using sqflite.
    **Form Validation**: Ensures data integrity.

**Installation**

  **1- Clone the repository:**
      git clone https://github.com/yourusername/mobile_store_app.git
      cd mobile_store_app
      
  **2- Install dependencies:**
      flutter pub get
      
  **3- Run the application:**
      flutter pub get

**Project Structure**
  **lib/:**
    auth/: Authentication-related screens and controllers.
    dashboard/: Main dashboard modules, including product and cart management.
    database/: Database helper classes for SQLite operations.
    utils/: Utility classes for common functionalities like validation, custom buttons, and text fields.

**Usage**
  **Adding a Product (Admin Feature)**
      1- Navigate to the products page.
      
      2- Click on the "Add Product" button.
      
      3- Fill out the form with the product name, price, and image URL.
      
      4- Save the product to store it in the local database and update the product list.

  **Browsing Products**
      
      1- View the list of available products with detailed information.
      
      2- Mark products as favorites or add them to the cart.
  
  **Cart Management**
      
      1- Add products to your cart.
      
      2- Remove products from your cart.
      
      3- View the cart contents with persistent storage.

**Contributing**
    
    1- Fork the repository.
    
    2- Create a new branch (git checkout -b feature/your-feature).
    
    3- Commit your changes (git commit -m 'Add some feature').
    
    4- Push to the branch (git push origin feature/your-feature).
    
    5- Create a new Pull Request.

**License**
  Not Needed

**Acknowledgements**
  
  1- Flutter and Dart teams for providing the tools and documentation.
  
  2- Community contributors for their helpful packages and resources.

**Contact**

For any inquiries or feedback, please contact omarmoharam790@gmail.com .
 

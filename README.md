# User Authentication and Verification
This is a simple Rails only api application that allows users to authenticate and verify their accounts. It includes basic authentication features such as sign-up, sign-in, and password reset functionality, as well as a verification system to verfy the email

# Table of Contents
* Installation
* Usage
* Contributing

# Installation
To run this application locally, you will need to have Ruby and Rails installed on your machine. Once you have these installed, follow these steps:
* clone the repository into your local machine.    
git clone https://github.com/mayankbhatt07141/Authy.git
* Navigate to the application directory:   
cd Authy
* Install the required gems:  
bundle install
* Create and migrate the database:   
rails db:create  
rails db:migrate
* Start the Rails server:   
rails server
* Open your web browser and navigate to http://localhost:3000

# Usage
Once you have the application running, you can use it to authenticate and verify users. Here are some of the key features:

* Sign up: New users can create an account by providing their email address and a password.

* Sign in: Users can sign in to the application using their email address and password.

* Password reset: If a user forgets their password, they can reset it by clicking on the "Forgot Password" by hitting reset route.

* Verification: Users can verify their accounts by clicking on the verification link sent to their email address after sign-up. Once a user is verified, they will have access to additional features in the application.  
# Contributing
This is an open-source project, and contributions are welcome! If you find a bug or have an idea for a new feature, please open an issue on the GitHub repository. If you would like to contribute code, please fork the repository and submit a pull request.

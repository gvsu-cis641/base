# Software Requirement Specifications
## 1. Overview:
The software requirement specification document outlines the requirements of Team-S project, a ride-sharing application among university students. This document explains about the app features, interfaces and designs.


## 2. Requirements

### 2.1 Functional Requirements
1. Manage User Login:
    1. Welcome splash screen with application logo shall be displayed while initial loading the application.
    3. Upon completion of application loading, the welcome screen shall display sign-up and sign-in buttons for selection.
    5. Sign-up view shall be displayed when the user presses the sign-up button.
    6. Sign-in view containing password recovery link shall be displayed when the user presses the sign-in button.
2. Profile Creation:
    1. After clicking on sign up option, users details shall be captured like - name, Vehicle details, home address.
    2. Sign-up view shall contain a form with input fields for user's name, home address, and add-vehicle button.
    3. Sign-up form shall append more input fields for user's vehicle make, vehicle model, and vehicle color, when the user presses the add-vehicle button.
    4. Sign-up form inputs shall be validated when the user presses submit button.
    5. A verfication email shall be sent to the user's email when the sign-up form validation is successful.
3. Operational Requirements:
    1. After successful login, the main board view shall be displayed.
    2. The main board view shall include a create-post button and a list of posts created by others.
    3. The user shall have option to select request-ride or offer-ride only if the user already registered a vehicle.
    4. If the user does not have a vehicles registered in the account, then the user shall only be able to create request-ride post.
    5. The create-post form shall be displayed when the user presses the create-post button. 
    6. The create-post form with ride-request option shall include input fields for start point, and destination time.
    6. The create-post form with ride-share option shall include input fields for start point, destination time, and vehicle capacity.
    9. On the main board view, user shall have search bar to search any ride by typing destination.
    10. User shall be able to comment for any displayed post.
    
### 2.2 Non-Functional Requirements
1. Quality:
    1. All user shall have valid GVSU email address.
    2. Application shall handle all student and staff members which is around 30K.
    3. Performance of the application shall be monitored using AWS Cloudwatch.
    4. After posting a post only the creator shall be able to delete post.
    5. Only the posts that are related to travel plan shall be posted.
    6. Code for application shall be short and easily readable.
2. Operational Requirement:
    1. The system shall be operated on an AWS EC2 instance.
    2. The system shall run on both Android and iOS devices.
    3. The system front-end UI shall be created using React-Native.
    4. The system back-end server shall be created using Python Flask framework.
    5. All images for the application shall be stored in AWS S3 buckets.
    6. The system shall store all of its user and post data in NoSQL format in DynamoDB of AWS.
    

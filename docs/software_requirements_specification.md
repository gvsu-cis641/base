# Software Requirement Specifications
1. ## Overview:
The purpose of software requirement specification document is to outline the requirements of Team-S project which is an application for Ride sharing between university students. It will explain about the features, interfaces and design of an application. It will be build on highly used operating systems such as Android and iOS using front end UI (React Native), database and AWS cloud services.


2. ## Functional Requirements

    1. **Manage User Login**:
        1. When user clicks on application, welcome screen shall display logo.
        2. Welcome screen shall display sign up and sign in button for selection. 
        3. Different page for sign up shall be created.
        4. Different page for sign in shall be created with forget password option.
    2. **Profile Creation**:
        1. After clicking on sign up option, users details shall be captured like - name, Vehicle details, home address.
        2. Option for verification of email shall be included after filling personal information. 
    3. **Operational Requirements**:
        1. After successful login or profile creation user shall have option to select if they want to ride or offer a ride.
        2. Option for post shall be available to both rider and passenger with boxes like start point, destination and time.
        3. After posting a post only that user shall have access to delete post.
        4. For replying to any existing post, comment box shall be included.
    

2. ## Non-Functional Requirements
    1. **Quality**:
        1. All user shall have valid GVSU email address.
        2. Application shall handle all student and staff members which is around 30K.
        3. Performance of the application shall be monitored using AWS cloudwatch.
        4. Based on some conditions users post shall be deleted.
    2. **Operational Requirement**:
        1. The system shall be operated on an EC2 instance of AWS
        2. The system shall run on both android and iOS devices.
        3. All images for the application shall be uploaded in AWS S3.
    

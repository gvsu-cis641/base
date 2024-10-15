# Software Requirements Specification (SRS) for Campus AI Chatbot

## Overview

This document outlines the Software Requirements Specification (SRS) for the CampusConnect AI Chatbot, designed to enhance the user experience for students, faculty, and prospective applicants on the college website. The chatbot will efficiently handle inquiries related to admissions, event registration, appointment scheduling, and library services.

## Functional Requirements

### 1. Admission Inquiry Feature
FR1-Users shall be able to ask questions about the college's admission process.
FR2-The chatbot shall provide relevant information such as deadlines, admission criteria, and answers to frequently asked questions.

### 2. Event Registration Feature
FR3-Students shall be able to register for campus events through the chatbot.
FR4-The chatbot shall send a confirmation message to the student upon successful registration.


### 3. Faculty Appointment Scheduling Feature
FR5-Students shall be able to book appointments with faculty members.
FR6-The chatbot shall display available appointment slots based on the faculty member’s calendar.


### 4. Application Status Checking Feature
FR7-Prospective students shall be able to check their application status using their application ID.
FR8-The chatbot shall retrieve real-time status updates from the admissions system.


### 5. Library Book Availability Feature
FR9- Users shall be able to check book availability by providing the title or ISBN.
FR10-The chatbot shall interact with the library’s database to retrieve current availability status.


### 6. Admin Data Update Feature
FR11-Admins shall be able to securely log in to update FAQs, event details, and database entries.
FR12-Data update privileges shall be restricted to authenticated admin users only.


## Non-Functional Requirements

### 1. Performance
NFR1-The chatbot shall respond to queries within 3-5 seconds.
NFR2-The system shall maintain performance during peak admission periods.

### 2. Scalability
NFR3-The chatbot shall support up to 500 concurrent users without performance degradation.
NFR4-The system shall scale efficiently with increased user activity during large campus events.

### 3. Security
NFR5-Encrypted connections (SSL/TLS) shall be used to ensure data privacy and security.
NFR6-Multi-factor authentication (MFA) shall be required for admin access.

### 4. Availability
NFR7-The chatbot shall maintain 99.9% uptime.
NFR8-Automatic failover shall be implemented to ensure continuous availability in case of server failure.

### 5. Usability
NFR9-The chatbot interface shall be intuitive, with clear prompts and responses.
NFR10-It shall utilize NLP to understand a wide range of user queries.

### 6. Maintainability
NFR11-The codebase shall adhere to clean coding standards and be well-documented for ease of maintenance.
NFR12-The system shall be modular to allow easy addition or updating of features.

### 7. Data Integrity
NFR13-All transactions, including event registrations and application status checks, shall be accurate, ensuring no data loss or corruption.
NFR14-Interaction logs shall be maintained for audit and debugging purposes.

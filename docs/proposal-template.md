
Team name: Snap Crackle Pop

Team members:
- Ashley Allen 

# Introduction

The ITC Deduction team at W.K. Kellogg Co. (WKKC) is responsible for resolving deductions that come in from a customer. A deduction in this sense is a customer short payment for any number of reasons. To clear a deduction, the team needs to validate that it is either valid or invalid by reviewing the customer backup and trade agreements with sales team. However, many times customers do not attach appropriate feedback or the team needs to work with sales to identify if the deduction is valid or not based on the contract. This can lead to deductions piling up and if it ages past 180 Days it is written off as bad debt and we lose this income. 

Each analyst on the team supports a specific customer. Because deductions are very specific based on the customer, it can be more challenging to clear some compared to others. For this reason, we see an uneven workload across the team. 

The objective of this project is to establish a tool that will allow managers to identify the following: 
1. How long, on average, does it take to clear a deduction for any one specific customer 
2. How long is it taking an individual analyst to clear a deduction
3. Predict how long it will take to clear the deduction balance given the current resources (analysts) available on that account 
4. Assign resources to a customer account based on account need


# Anticipated Technologies

- SQL databse used by WKKC and supported by IT - aka Keystone. 
- Python will be the primary program language of choice 
- High Radius and SAP are primary tools used for clearing deductions and feeding data. 
- Server support from IT to publish in local WKKC environment for collaborative use across ITC organization

# Method/Approach

- Determine organizational needs. What do they really need to know? How do they need to manage it 
- Establish organization hierarchy including - managers, analysts, coders, sales, and what customers each support 
- Develop a user input method so that managers can update application with changing assignments
- Determine best methodology for calculating average clearing time both using historical and current data 
- Determine how to calculate analyst clearing time 
- Forecast customer balance clearing based on historical and current averages and analyst clearing time 
- Build interface that allows managers to adjust clearing time by assigning resources (analysts) to specific accounts
- Continuously test for errors or problems that might crash the application 
- Deploy to in-house server
- Have manager test group review 

# Estimated Timeline

- Requirements and Information Gathering - 2 weeks 
- User Input Build and SQL communication - 1 week 
- Get customer (manager) sign off on average calculation to ensure accuracy - 2 weeks 
- Build forecast and get customer sign off - 1 week
- Build GUI - 2 weeks 
- Deploy - 2 weeks 

# Anticipated Problems

- Deduction automation is set to begin in 6 to 8 months. With automation in place, AI will be implemented to decrease the average time to clear deductions for specific customers only. This will play into how long it takes each analyst to clear a specific customer account. 

- Many of the new analysts on this team have almost no deduction clearing experience. We have several analysts with 15+ years and so we would expect their average time to be higher. We will need to consider the historical time to clear a deduction using 2 years’ worth of Kellanova data, but also consider the current average time using WKKC data. We need to set fair expectations for new analysts who are still learning accounts. 

- Clear time will be affected by responses by coders, customers, and sales partners. How can we effectively manage communication with these partners in order to streamline the deduction clearing process? 

- This project will need to be established in the WKKC environment to protect sensitive data. This means I will need IT support and cooperation to successfully deploy for the team to use. 

- Team assignments are frequently changing, so we will need a way to track when a customer is being handled by a new analyst.

# Overview
The SRS is an official report that acts as a software representation, enabling clients to determine whether the report (SRS) fits their demands. It also contains detailed explanations of the system requirements as well as the system's user requirements. Here our project online grocery store application helps consumers to get easy access to their daily basic needs. The main goal of creating a grocery app in connection with a grocery store is to offer a customer loyalty program that will help to keep the current customers and draw in new ones.
# Software Requirements
The software requirements stage involves the creation of Software Requirements Specifications (SRS) (also called a requirements document). This report, which lays the foundation for efforts in software engineering, is created after all requirements have been elicited and analyzed. 

## Functional Requirements
### login/signup 

| ID  | Requirement |
| :-------------: | :----------: |
| FR1 | The System SHALL allow user to login to the application system. |
| FR2 | The System SHALL allow customer, vendor and delivery agent to register an account if does not exist |
| FR3 | The System SHALL allow users to add their deatils like Name, address, phone number and  email. |
| FR4 | The System SHALL allow user to save their information.|
| FR5 | The System SHALL allow user to verify their email address. |

### Selecting items

| ID  | Requirement |
| :-------------: | :----------: |
| FR6 | The system SHALL allow user to select under different categories. |
| FR7 | The system SHALL allow user to add items to their cart. |
| FR8 | System SHALL allow users to pick products and buy. |
| FR9| The system SHALL allow user to add products to the wishlist. |
| FR10 | System SHALL enable the user to select the products that he wants to get home delivery. |

### Cart

| ID  | Requirement |
| :-------------: | :----------: |
| FR11 | The system SHALL allow user to select under different categories. |
| FR12 | The system SHALL allow user to add products to their cart. |
| FR13 | System SHALL allow users to pick products and buy. |
| FR14| The system SHALL allow user to move products to the wishlist to pruchase later. |
| FR15 | The System SHALL enable the user to select the products that they wish to move forward. |
| FR16| The system SHALL show the total estimated cost of the products in the cart. |
| FR17| The system shall have a + and delete option to add and delete the product from the cart. |


### Wishlist

| ID  | Requirement |
| :-------------: | :----------: |
| FR18 | The system SHALL have an option which allows user to add productss to their wishlist.  |
| FR19 | The system SHALL allow user to move products to the cart from their wishlist.  |
| FR20 | The system SHALL allow users to delete products from the wishlist. |
| FR21| The wishlist SHALL display cost of the products.|
| FR22 | The wishlist shall   |


### Payment

| ID  | Requirement |
| :-------------: | :----------: |
| FR23| Payment option SHALL be displayed when a user clicks on the payment icon. |
| FR24| The system SHALL have an option to select type of payment. |
| FR25| The System SHALL support user to make the payment for the products that he/she selected|
| FR26 | The system SHALL allow user to select tye of card for the payment |
| FR27 | The system SHALL allow user to enter card details like card number, cvv and expiry date. |
| FR28 | The system SHALL display a message if wrong card details are entered. |
| FR29| The system SHALL display a message if the payment is sucessfull. |

### Myorders

| ID  | Requirement |
| :-------------: | :----------: |
| FR30| The system SHALL display order status. |
| FR31| The system SHALL display all the products which the user placed.|
| FR32| The system SHALL display the total cost of the products.|
| FR33 | The System SHALL display the date of the order placed. |
| FR34 | The system SHALL display the previos orders of the users.   |

## Non Functional requirements

### Security

| ID  | Requirement |
| :-------------: | :----------: |
| FR35| The system SHALL use email for security verification. |
| FR36| The system SHALL only allow the admin to access permissions to the system. |
| FR37| The System SHALL only allow the admin to update or delete the products.|
| FR38|The system SHALL secure sensitive data of the user.  |
| FR39 |The system SHALL use standard authentication methods for online payments of user.   |

### Performance

| ID  | Requirement |
| :-------------: | :----------: |
| FR40| The system SHALL respond to multiple users at the same time. |
| FR341| The wesite SHALL load as fast as possible Regardless of the volume of traffic on the website  .|
| FR42|The system SHALL respond to user in less than 5 sec. |
| FR43 |The system SHALL provide all the results for all types of user inputs. |
| FR44 |The system SHALL be feasibility to user     |

### Usability

| ID  | Requirement |
| :-------------: | :----------: |
| FR45| The user SHALL easily navigate the website's interface. |
| FR46| The user SHALL be able to utilise all the features easily.|
| FR47|The user SHALL be able to use the different options for payment |
| FR48 | The user SHALL able to use the optional options provided to him/her. |
| FR49 | The system SHALL help the user in using the system by guiding him.    |

### Reliability

| ID  | Requirement |
| :-------------: | :----------: |
| FR50| The system SHALL . |
| FR51| The system SHALL |
| FR52| The system SHALL .|
| FR53 | The System SHALL  |
| FR54 | The system SHALL .   |

### Compatibility

| ID  | Requirement |
| :-------------: | :----------: |
| FR55| The system SHALL run independently with respect to type of machines. |
| FR56| The system SHALL able to run at different OS environments .|
| FR57| The system SHALL provide ability to share between different machines.|
| FR58 | The System SHALL work effectively with different versions of the software . |
| FR59 | The system SHALL able to enhance information exchange with different comnponents of software .  |

# Change management plan
A change management plan is a written list of actions that a we must follow to make sure any change that we experience and has the least possible negative effects on the business, clients, staff members, and essential stakeholders. A change management plan often supervises and manages the execution. Here in our project online grocessary store's change management plan is beneficial to prepare the change by quantifying and managing expenditures connected with the transition. And also having all the necessary procedures and actions clearly specified helps to shorten the time needed for change implementation. It helps the website to function as effectively as possible while implementing change, maintaining maximum productivity

## How will you train people to use it?
As it is totally new system for the client, we have planned to train the basic things initially by providing a dedicative manpower from our end once the user team is comfortable with basic usage then an ongoing training will also be arranged so that it provides real time experience. Training will be arranged for a group of people so that the user will have a back up person if they have any issues. When ever a new feature is updated then same will be trained accordingly. A process note will also be shared for reference.
## How will you ensure it integrates within their ecosystem / software?
The client is totally new to this as they are not using any software which is related to this. Everything in this system starts from scratch and this would take some time for the client to understand and get used to this. This might be difficult at the initial stage but later this will help the client a lot and makes the process so easy.

## How will you ensure that it any discovered issues are resolved?
Whenever if any issue identified by the client the same will be immediately attended by the team and it will be rectified at the earliest possible timeline. At first it will be addressed remotely and if required a client visit will also be done to make the things faster and smoother.

# Traceability links
<Description of this section>


## Use Case Diagram Traceability
| Artifact ID | Artifact Name | Requirement ID |
| :-------------: | :----------: | :----------: |
| UseCase1 | Move Player | FR5 |


## Class Diagram Traceability
| Artifact Name | Requirement ID |
| :-------------: |:----------: |
| classPlayer | NFR3, FR5 |


## Activity Diagram Traceability
<In this case, it makes more sense (I think, feel free to disagree) to link
to the file and to those requirements impacted>
| Artifact ID | Artifact Name | Requirement ID |
| :-------------: | :----------: | :----------: |
| <filename> | Handle Player Input | FR1-5, NFR2 |


# Software Artifacts
<Describe the purpose of this section>
* [I am a link](to_some_file.pdf)



# Read only List report using the RestFul Application Programming model
The ABAP RESTful Application Programming Model (RAP) defines the architecture for efficient end-to-end development of intrinsically SAP HANA-optimized Fiori apps. It supports the development of all types of Fiori applications as well as Web APIs. It is based on technologies and frameworks such as Core Data Services (CDS) for defining semantically rich data models and a service model infrastructure for creating OData services with bindings to an OData protocol and ABAP-based application services for custom logic and SAPUI5-based user interfaces.

Considered a Flight reference model to display connections and with repsect flight detials in Fiori App.

**Database Tables** :
/DMO/CONNECTIONS : It has all connection details of the flights
/DMO/Carrier : It has all details of the carrier
/DMO/FLIGHT : It has flight details of the connections
![image](https://github.com/user-attachments/assets/be6a10a5-8371-48b2-822c-0ad49e616959)

**Data Model - RAP framework**
![image](https://github.com/user-attachments/assets/10ee19b4-79e6-4fc4-8a9e-4b412d935d34)

**Functionalities Covered**
1.Generate a List report for Connections
2.Provide Selection and search functionality
3.Provide F4 help for the selection fields
4.Generate secondary list display (Object Page )for complete connection Details and Flight details

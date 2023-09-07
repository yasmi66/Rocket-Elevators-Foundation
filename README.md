## Rocket_Elevators_Information_System
+ HTML 5
+ CSS 3
+ Javascript
+ Bootstrap 4
+ Web Application with Ruby on Rails and Ubuntu 22.2
+ Transactional Relational Database: mySQL
+ Decision Support Database
+ Connection and operation of Third-Parties APIs: Slack, Twilio, FreshDesk, Sendgrid, Amazon Polly, Google Maps, Dropbox
+ REST API
+ GraphQL API

# Description WEEK 8 - CONSOLIDATION WEEK
During this week, a new Interventions table was added to the SQL Database and a Intervention Request Form was added to the Rocket Elevators Website.

The Intervention Ticket Creation page can be accessed from the navigation bar by clicking on "Interventions". 

Clicking on the "CREATE INTERVENTION TICKET" button will send the information filled in the form to the Interventions table in the database and will also create a new Interventions ticket in Freshdesk. 

# How it works

To access to the interventions ticket creation page, you need to be logged into a session. The Intervention Ticket Author will be attributed to the user loggen in the session. Once logged in, you can access the Interventions form from the navbar (links to /interventions/new). To see all the recorded interventions (#show), simply type localhost:3000/interventions. All the interventions are also accessible from the admin backoffice and can be viewed in a dashboard. 

The Interventions form in interactive and steps 2 to 5 are triggered by the completion of the previous step (selection of the previous field). The Column, Elevator and Employee fields are set to "None" by default and can be left Null. Also, the Employee and Description fields are not related to the Steps 1-5 cascade and are displayed at all times on the form.


# FreshDesk API

FreshDesk is a SaaS platform to which you can subscribe and which allows you to manage the workflow that takes place when a customer or user comes into contact via the Website either via the “Contact Us” form, the “Get a Quote” form or via the "Interventions" form. In all cases, the submission of the form creates a ticket in FreshDesk and the information is sent to the process center and recorded in the database.

- Go to the admin freshdesk page. ( https://rocketfoundation.freshdesk.com/a/tickets ) .
- Once inside the freshdesk interface, click the ticket button at the left side of the page. 
- You can see all received tickets created from submissions of either the "Contact us" form, the "Quote Request" form or the "Interventions" form.






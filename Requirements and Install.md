# Requirements

1. Ruby on Rails
2. BaseX  
  * http://basex.org/products/download/all-downloads/
3. Java 7
  
 

# Install

1. Install Ruby on Rails
2. Install BaseX 
3. Start BaseXServer
4. Start BaseXClient
5. Enter Usernamen and Password
  * Default Username:"admin"
  * Default Password:"admin"
6. Create DB
  * Enter: "db:create("DBXML", "[YOURPATH]/XML-APP/public/PortraitData.xml")"
7. Start Ruby Server 
  * Navigate to Projectfolder [YOURPATH]/XML-App
  * Enter: "rails server"
8. Go to http://localhost:3000/ and the app starts

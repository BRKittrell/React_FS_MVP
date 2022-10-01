/*This file is for inserting "dummy data" as an entity into the database
table(s) and testing the server's RESTful routes.*/

/*SEEDING
- Use the PSQL commands INSERT INTO and VALUES.
- The order of table attributes and values matter. In the below seed, the
Blog_Title will be Boolean, Variables, Objects, and Node JS.
- IMPORTANT! When using PSQL commands, they must be ended with a semicolon!
*/

INSERT INTO Notes_Blog (Blog_Title, Blog_Entry) VALUES ('Booleans', 'Booleans are conditionals with true or false values.');
INSERT INTO Notes_Blog (Blog_Title, Blog_Entry) VALUES ('Variables', 'Variables are mutable but store immutable values.');
INSERT INTO Notes_Blog (Blog_Title, Blog_Entry) VALUES ('Objects', 'Objects store properties in key:value pairs.');
INSERT INTO Notes_Blog (Blog_Title, Blog_Entry) VALUES ('Node JS', 'Node JS is a runtime that uses the Chome V8 engine.');

/*MIGRATION
- Seed the database using the following command: psql Blog_Notes -f seed.sql
- Verify successful seeding. 
    1. Run the command 'psql postgres'.
    2. Connect to the database by running the command '\c Notes_Blog'.
    3. Run the psql command SELECT * FROM 'Notes_Blog'. 
    NOTE: In this app, the table and database names are the same, in step 3, 
    'Notes_Blog' refers to the table, not the db. In a database with multiple
    tables, it is advisable to practice deliniating naming convention. 
*/

/*TESTING RESTful ROUTES
- Use an API such as Postman. It is advisable to download the Postman app.
- Steps for testing with Postman:
    1. Install nodemon, a tool that automatically restarts the application when 
    a change is detected. Use the command 'npm install nodemon'.
    2. Start the server by running the command 'node server.js'. 
    3. Verify that the serer is listening by inspecting the console in VS Code. If 
    'Listening on port 8000' is printed, the server is running.
    3. Open the Postman app.
    4. We will test the GET all route first. In the drop-down menue, select GET.
    5. In the input box containing the text 'Enter request URL', type in the
    following: localhost:8000
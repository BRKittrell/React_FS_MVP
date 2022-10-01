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
INSERT INTO Notes_Blog (Blog_Title, Blog_Entry) VALUES ('Node JS', 'Node JS is a runtime that uses the Chrome V8 engine.');

/*MIGRATION
- Seed the database using the following command: 'psql Blog_Notes -f seed.sql';
this will give the table entities for testing RESTful routes.
- Verify successful seeding. 
    1. Run the command 'psql postgres'.
    2. Connect to the database by running the command '\c Notes_Blog'.
    3. Run the psql command 'SELECT * FROM Notes_Blog'. 
    NOTE: In this app, the table and database names are the same, in step 3, 
    'Notes_Blog' refers to the table, not the db. In a database with multiple
    tables, it is advisable to practice deliniating naming convention. 
*/

/*TESTING RESTful ROUTES
- Use an API such as Postman. It is advisable to download the Postman app.
- Steps for testing with Postman:
    1. Start the server by running the command 'node server.js'. 
    2. Verify that the serer is listening by inspecting the console in VS Code. If 
    'Listening on port 8000' is printed, the server is running.
    3. Open the Postman app.
    4. Test GET ALL. 
        - In the drop-down menu, select 'GET'.
        - In the input box containing the text 'Enter request URL', type the
        following: 'localhost:8000/Notes_Blog'. 
        - In the Postman console, click on 'Body'.
        - Click 'Send'.
        - The entities will appear in JSON. Success!
    5. Test GET ONE.
        - On postman, type the following: 'localhost:8000/Notes_Blog/1'.
        - Click 'Send'.
        - The first entity in the seed.sql has the id of 1, the second has an id of 2
        and so on.
    6. Test POST.
        - On Postman, select 'POST' from the dropdown menu.
        - Type in the following JSON object in the body in Postman: 
        {"Blog_Title": "Methods":"Blog_Entry":"Methods are propererties that contain a function definition."}
        - Click 'Send'.
        - Repeat step 4. The new entry will appear at the end of the list.
    7. Test PATCH.
        - On Postman, select 'PATCH' from the dropdown menu.
        - Type in 'localhost:8000/Notes_Blog/1.
        - Type in the following JSON object in the body in Postman:
        {"Blog_Title": "Arrays":"Blog_Entry":"Arrays can hold multiple value types under a single variable."}
        - Click 'Send'.
        - Repeat step 4. The updated entity will appear at the bottom of the JSON object,
        but notice that it maintains the same primary key.
    8. Test DELETE.
        - On Postman, select 'DELETE' from the dropdown menu.
        - Type in 'localhost:8000/Notes_Blog/1.
        - Click 'Send'.
        - Repeat step 4. Blog_number 1 will no longer exist.
        NOTE: When primary key is deleted, it will never be repeated.
        - Notice the message "Blog entry 1 has been deleted." Look at the server.js
        file to see how this message was displayed in the console.
        */

/*CLEARING THE SEED
- After testing the routes, you will want to clear all entities and restarte the 
primary key id.
    1. Type the command 'psql postgres' in the command line.
    2. Type the command '\c Notes_Blog'.
    3. Once connected to the database, type in the command:
     'TRUNCATE Notes_Blog RESTART IDENTITY'; this will clear all entities and 
     restart the identity sequence - in other words, the id of any new post
     will begin at 1.
    4. 
*/

/*BUILD THE FRONT END
- Now that the PSQL and express server are built, the front end must be built.
- See Instructions.md Method step 4.
*/
/*This file is used to set up a server that manages HTTP requests using Node and Express JS
to implement CRUD functionality.*/

/*CONFIGURE PACKAGES
1.  In the command line, run 'npm init -y' to initialize the node package manager
    and install a package.json file which contains dependencies for the app to function.
2.  Run 'npm install express'. This will install the express package.
3.  Install the cors package, a middleware that will help React and Express communicate.
    CORS is Cross-Origin-Resource sharing.
4.  Install pg (node-postgres), a middleware that links the database to the server. 
    Use the command 'npm install pg'. We will create a 'pool' using node-postgres.
5.  Verify that all dependencies have been installed by viewing the package.json file.
*/

/*
NOTE: How middleware works in the request/response cycle: 
Request: Client->Server->Database
Response: Database->Server->Client
*/

/*REQUIRE PACKAGES
Note: Once the packages are installed, you must 'require' them in the file.
*/
const express = require('express');
const app = express ();
const cors = require('cors')

/*POOL*/
const {Pool} = require('pg');
const {application, json} = require('express');
const pool = new Pool({
    user: 'brandonkittrell',
    password:"",
    host: 'localhost',
    port: 5432,
    database: 'Notes_Blog'
});

/*PORT DECLARATION*/
const PORT = 8000;

/*MIDDLEWARE
The app.use() function "mounts" the middleware.
 */
app.use(express.static("public"));
app.use(express.json());
app.use(cors())

/*CRUD FUNCTIONALITY
We will now create RESTful routes for POST, GET, PATCH, and UPDATE*/

/*POST ONE -> creates new entity*/
app.post('/Notes_Blog', async (req, res) => {
    try{
        const {Blog_Title, Blog_Entry} = req.body;
        const {rows} = await pool.query('INSERT INTO Notes_Blog (Blog_Title, Blog_Entry) VALUES ($1, $2) RETURNING *;', [Blog_Title, Blog_Entry]);
        res.send(rows);
    }catch(err){
        res.send(err).status(404);
        console.log(err);
    }
});

/*GET ALL -> retrieves all entities from the table(s).*/
app.get('/Notes_Blog', async (req, res) => {
    try{
        const {rows} = await pool.query('SELECT * FROM Notes_Blog');
        res.status(200).send(rows);
    }catch (err){
        res.send(err);
        console.log('Cannot get all')
    }
})

/*GET ONE -> retrieves a signle entry based on id parameters.*/
app.get('/Notes_Blog/:id', async (req,res) => {
    try{
        const {id} = req.params;
        const {rows} = await pool.query('SELECT * FROM Notes_Blog WHERE Blog_Number =$1;', [id]);
        res.status(200).send(rows);
    }catch (err){
        res.send(err);
        console.log("Oops! That blog entry doesn't exist.");
    }
});

/*UPDATE ONE -> updates a single entry based on id parameters.*/
app.patch('/Notes_Blog/:id', async (req, res) => {
    try{
        const {id} = req.params;
        const {Blog_Title, Blog_Entry} = req.body;
        const {rows} =await pool.query('UPDATE Notes_Blog SET Blog_Title = $1, Blog_Entry = $2 WHERE Blog_Number = $3;', [Blog_Title, Blog_Entry, id])
        res.status(200).send(rows)
    }catch (err){
        res.status(404).send(err);
        console.log(err)
    }
});

/*DELETE ONE -> deletes a single entry base on id parameters.*/
app.delete('/Notes_Blog/:id', async (req, res) =>{
    try{
        const {id} = req.params;
        await pool.query('DELETE FROM Notes_Blog WHERE Blog_Number = $1;',[id]);
        res.status(200).send(`Blog entry ${id} has been deleted.`);
    }catch (err){
        res.status(404).send(`Blog entry ${id} does not exist.`);
    }
})

/*PORT BINDING
The express app.listen() function connects the specified host and port.
Refer to the host used in the pool above and declared port.*/
app.listen(PORT, ()=>
console.log(`Listening on port ${PORT}`));

/*TEST THE REST ROUTES
Once the routes are created, create a "seed" file to create entities (rows)
in the database. Use an API platform such as Postman to test your routes. 
See Step 3 in Instructions.md for further guidance.
*/
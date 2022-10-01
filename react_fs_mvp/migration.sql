/*This page is for data definition, which means creating a table to 
be used in the database.*/ 

/*Prepare by using 'DROP TABLE IF EXISTS'; this ensures that commands
can be repeatedly executed. DROP TABLE has three parameters; IF EXISTS, 
CASCADE, AND RESTRICT. IF EXISTS ensures that an error is not thrown if
the table does not exist.*/

/*CREATE TABLE defines a new table in PSQL; follow CREATE TABLE with the 
name of the table without spaces. After defining the table, give it attributes
(columns); again, do not use spaces in naming convention. Define the data type 
and primary key; see PostgreSQL documentation for datatypes.*/

/*A NOTE ABOUT char and varchar: 
- The char datatype is for storing character strings of fixed length.
- The varchar dataype is used to store character strings of variable length.
*/
CREATE DATABASE Notes_Blog;
DROP DATABASE Notes_Blog;
DROP TABLE IF EXISTS Notes_Blog;
CREATE TABLE Notes_Blog (
Blog_Number serial PRIMARY KEY,
Blog_Title char(25),
Blog_Entry varchar
);

/*  Once the table(s) have been defined, it/they can be inserted into the database.
    Use the following steps to migrate the database:

1.  Create the database that will contain your table(s) by typing 'createdb' in 
    the command line followed by the name of the database. Example: createdb blog
2.  Verify that PSQL has been installed by typing 'postgres -V'; this will display
    the current version if installed; otherwise, use HomeBrew to install PSQL.
3.  To ensure the database hase been created, begin the PSQL REPL by typing 'psql'
    followed by the database name. For example, psql Notes_DB. Once the REPL has 
    been accessed, type in \l in the command line to display all databases.
4.  Now that the database is craeted, it's time to "migrate" the table into the 
    database. Quit the PSQL REPL by typing \q in the command line.
5.  IMPORTANT! The next step is db migration (inserting the dable into the database). 
    In the command line, make sure that you change directories into the location that 
    your migration file exists; use commands cd and ls to find the file. In this app, 
    the folder is src.
6.  In the command line, type in the following: 'psql name_of_db -f sql_file_name.sql.
    By naming convention, the sql containing the table(s) should be 'migration.sql'.
    For example: psql Notes_Blog -f migration.sql.
7.  Verify that migration was successful by typing in psql followed by the name of the
    database. Type \dt in the command line to display database tables.
8.  Verify that the desired table attributes (columns) are contained in the table. 
    You should already be in the psql REPL. Type in the command '\d' followed by the table name(s).
    To change attributes, edit the table attributes in the file and re-migrate.
*/
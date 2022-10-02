# This application was built using PostgreSQL, Express JS, React JS, and Node JS. React componenents herein are functional (not class). 
- Read more about compoents at https://reactjs.org/docs/components-and-props.html. 

# Detailed instructions are included on each file.

# Before begginning, create a React app.
- Run the command 'npx create-react-app react_fs_mvp' in the command line; react_fs_mvp will be the name of the app for this project. 
- This will instll pertinent folders and files, including a public folder containing a html.index with a root <div> and a src (source) folder containing an App.js and App.css file.

# Method
1. Build a SQL database. (See migration.sql) 
2. create a RESTful API with CRUD functionality. (See server.js)
3. Create a SQL "seed" file in the src folder using the touch command: 'touch seed.sql'. (See seed.sql)
4. Create the React components for each Route. In the command line:
    a. Change directories to the src folder. 
    b. Make a new folder named 'components' by running the command 'mkdir components'.
    c. Create new files for each component based on the RESTful routes by running the following commands:
        - touch CreatePost.js
        - touch DeletePost.js
        - touch EditPost.js
        - touch ReadAll.js
        - touch ReadOne.js
5. Export the components. This is accomplished using the export and default keywords. For example: 'export default CreatePost'. (See each compoent.)
6. Import each component to the App.js file using the keywords import and from and file path. Example syntax: 'import CreatePost from './components/CreatePost'. 
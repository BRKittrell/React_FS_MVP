import React from "react"
import axios from "axios"
import './App.css';

import CreatePost from "./components/CreatePost"
import DeletePost from "./components/DeletePost";
import EditPost from "./components/EditPost";
import ReadAll from "./components/ReadAll";
import ReadOne from "./components/ReadOne";


function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;

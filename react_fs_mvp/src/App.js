/*IMPORTS
- Import the React hooks useState and useEffect.
- Import axios from "axios".
- Import styling from App.css.
- Components
 */

import {useState, useEffect} from "react"
import axios from "axios"
import './App.css';
import CreatePost from "./components/CreatePost"
import ReadAll from "./components/ReadAll";
import ReadOne from "./components/ReadOne";
import EditPost from "./components/EditPost";
import DeletePost from "./components/DeletePost";

/* Use ES6 Syntax arrow functions*/
const App = () => {
  const {entry, setEntry} = useState([]);
  const {readAllEntries, setReadAllEntries} = useState(null);
  const {readSingleEntry, setSingleEntry} = useState(null);
  const {editEntry, setEditEntry} = useState([]);
  const {deleteEntry, setDeleteEntry} = useState([]);
  const {loading, setLoading} = useState(true);
  
  useEffect (() => {
    async function setEntry(){
      const res = await axios.post("./Blog_Notes");
      setEntry(res.data);
    }
    setEntry()
  }, []);

  useEffect(() => {
    async function setReadAllEntries(){
      const res = await axios.get("./Blog_Notes");
      setReadAllEntries(res.data);
    }
    setReadAllEntries
  }, []);

  useEffect(() => {
    async function setSingleEntry(){
      const res = axios.get("./Blog_Notes/{id}");
      setSingleEntry
    }
    setSingleEntry()
  }, []);

  useEffect(() => {
    async function setEditEntry(){
      const res = await axios.patch("./Blog_Notes/{id}")
      setEditEntry(res.data);
    }
    setEditEntry()
  }, [])

  useEffect(() => {
    async function setDeleteEntry(){
      const res = await axios.delete("./Blog_Notes/{id}")
      setDeleteEntry(res.data);
    }
    setDeleteEntry()
  }, []);
}

return (
  <>

  </>
)   

export default App;
const rootElement = document.getElementById('root');
ReactDOM.render(<App />, rootElement);
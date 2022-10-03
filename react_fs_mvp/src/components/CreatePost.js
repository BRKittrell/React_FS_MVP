import React from 'react'

const createEntry = () => {
    const handleOnSubmit = (entry) =>{
        console.log(entry)
    }
    return(
        <>
            < BlogEntry handleOnSubmit={handleOnSubmit} />
        </>
    )
}
export default CreatePost

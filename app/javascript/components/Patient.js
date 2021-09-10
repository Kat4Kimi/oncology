import React from 'react';

const Patient = ({ patient }) => {
  const { name, id } = patient
  return (
    <>
      <h1>{name}</h1>
      <br />
      <a href="/">Back</a>
      <br />
      <a href={`/patients/${id}/appointments`}>Topics</a>
    </>
  )
}

export default Patient;
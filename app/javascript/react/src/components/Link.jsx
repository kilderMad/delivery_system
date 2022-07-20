import React from "react";

export const Button = ({title, path}) => {
  return (
    <div className='item_menu ml-2'>
      <a href={path}>{title}</a>
    </div>
  )
}
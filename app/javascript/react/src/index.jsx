import Hello from "./components/Hello"
import * as React from "react";
import * as ReactDOM from "react-dom";


document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Hello/>, rootEl);
});
import * as React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { Home } from "../templates/Home";
import { Menu } from "./Menu";

const App = () => {
  return (
    <BrowserRouter>
      <Menu />
      <Routes>
        <Route path="/" element={<Home />} exact />
      </Routes>
    </BrowserRouter>
  );
};

export default App;

import * as React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { Home } from "../templates/Home";
import { Menu } from "./Menu";
import { Order } from "../templates/Order";

const App = () => {
  return (
    <BrowserRouter>
      <Menu />
      <Routes>
        <Route path="/" element={<Home />} exact />
        <Route path="/orders/search/:code" element={<Order />} />
      </Routes>
    </BrowserRouter>
  );
};

export default App;

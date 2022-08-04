import React from "react";
import { Button } from "./Button";
import { Link } from "react-router-dom";

export const Menu = () => {
  return (
    <header>
      <nav id="menu" className=" flex justify-between">
        <div className="flex items-center">
          <div className="item">
            <h2>DeliveryFast</h2>
          </div>
          <Link to="/">Home</Link>
          <Link to="/carries">Transportadoras</Link>
          <Link to="/orders">Pedidos</Link>
          <Link to="/">Dashboard</Link>
          <Link to="/carrier/carrier_id/prices">Tabela de preços</Link>
          <Link to="/">Tabela de prazos</Link>
          <Link to="/orders">Pedidos</Link>
        </div>
        <div className="flex">
          <div className="px-4">Current-user</div>
          <a href="/users/sign_in">Entrar</a>
        </div>
        <Button path="/users/sign_out" method="delete" title="Sair" />
      </nav>
    </header>
  );
};

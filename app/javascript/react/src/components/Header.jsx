import React from "react";
import { Button } from "./Button";
import { Link } from "./Link";

export const Header = () => {
  return (
    <header>
      <nav id="menu" className=" flex justify-between">
        <div className="flex items-center">
          <div className="item">
            <h2>DeliveryFast</h2>
          </div>
          <Link title="Home" path="/" />
          <Link title="Transportadoras" path="/carries" />
          <Link title="Pedidos" path="/orders" />
          <Link title="Dashboard" path="/" />
          <Link title="Tabela de preços" path="/carrier/carrier_id/prices" />
          <Link title="Tabela de prazos" path="/" />
          <Link title="Pedidos" path="/orders" />
        </div>
        <div className="flex">
          <div className="px-4">Current-user</div>
          <Link title="Entrar" path="/users/sign_in" />
        </div>
        <Button path="/users/sign_out" method="delete" title="Sair" />
      </nav>
    </header>
  );
};

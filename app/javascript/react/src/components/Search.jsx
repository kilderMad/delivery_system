import React, { useState } from "react";
import { Link } from "react-router-dom";

export const Search = () => {
  const [code, setCode] = useState("");
  const rota = `/orders/search/${code}`;

  return (
    <form action="/orders/search" method="get">
      <input
        value={code}
        onChange={(e) => setCode(e.target.value)}
        className="rounded-xl mt-3"
        type="text"
        placeholder="insira seu código"
      ></input>
      <Link
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-xl ml-1 cursor-pointer"
        to={rota}
      >
        Buscar Pedido
      </Link>
    </form>
  );
};

import React from "react";

export const Home = () => {
  return (
    <div className=" flex pb-20 items-center h-screen justify-center">
      <div className=" w-2/5">
        <h1 className=" text-3xl font-semibold">
          ECONOMIZE NA GESTÃO DE FRETES
        </h1>
        <p className=" my-3">
          Cote simultaneamente com diversas transportadoras e gere envios com
          rastreio inteligente em uma plataforma integrada
        </p>
      </div>

      <div className="pl-8 w-2/5">
        <h1 className=" text-2xl font-semibold">Rastreio de pedidos</h1>
        <p className=" my-2">
          Insira aqui o código de rastreamento do pedido ou da transportadora
          para localizar sua encomenda
        </p>
        <form action="/orders/search" method="get">
          <input
            className="rounded-xl mt-3"
            type="text"
            name="query"
            placeholder="insira seu código"
          ></input>
          <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-xl ml-1 cursor-pointer"
            type="submit"
          >
            Buscar Pedido
          </button>
        </form>
      </div>
    </div>
  );
};

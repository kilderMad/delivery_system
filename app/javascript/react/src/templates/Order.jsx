import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

export const Order = () => {
  const params = useParams();
  const [order, setOrder] = useState([]);
  useEffect(() => {
    fetch(`http://localhost:3000/api/v1/orders/search/${params.code}`)
      .then((response) => response.json())
      .then((data) => setOrder(data));
  }, [params]);

  return (
    <div>
      <div>
        Pedido {order.code} - Status: {order.status}
      </div>
      {order.vehicle && (
        <div>
          <h1>Informações do veiculo</h1>
          <p>
            {order.vehicle.brand} {order.vehicle.model} {order.vehicle.plate}
          </p>
        </div>
      )}

      <div>
        {order.updates ? (
          order.updates.map((update) => {
            return (
              <div className=" pb-2" key={update.id}>
                <p>
                  {update.date.split("-").reverse().join("/")} - {update.hour}
                </p>
                <p>
                  De {update.last_location} para {update.next_location}
                </p>
              </div>
            );
          })
        ) : (
          <p>Pedido ainda não foi enviado</p>
        )}
      </div>
    </div>
  );
};

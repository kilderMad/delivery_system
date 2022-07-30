pac = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
dll = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
correios = Carrier.create!(fantasy_name: 'Correios', cnpj: '22345678901243', domain: 'correios.com.br', address: 'Av. gen san martins, 65', email: 'support@correios.com.br')

User.create!(email: 'admin@live.com', password: 'password')
User.create!(email: 'joao123@dll.com.br', password: 'password', carrier: dll)
User.create!(email: 'kilder123@pac.com.br', password: 'password', carrier: pac)
User.create!(email: 'leticia123@correios.com.br', password: 'password', carrier: correios)

v_dll1 = Vehicle.create!(plate: 'PCL-2932', brand: 'Volkswagem', model: 'Delivery Express', year: '2022', capacity: 3500, carrier: dll)
v_dll2 = Vehicle.create!(plate: 'VHL-0923', brand: 'Volkswagem', model: 'Partner', year: '2021', capacity: 3000, carrier: dll)
v_dll3 = Vehicle.create!(plate: 'LYG-7910', brand: 'Hyundai', model: 'HR', year: '2019', capacity: 3400, carrier: dll)

v_pac1 = Vehicle.create!(plate: 'KOA-5613', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: pac)
v_pac2 = Vehicle.create!(plate: 'TYU-9864', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: pac)
v_pac3 = Vehicle.create!(plate: 'VGJ-2782', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: pac)

v_correios1 = Vehicle.create!(plate: 'BYJ-9521', brand: 'Renault', model: 'Master', year: '2020', capacity: 3500, carrier: correios)
v_correios2 = Vehicle.create!(plate: 'PSD-1111', brand: 'Renault', model: 'Master', year: '2020', capacity: 3500, carrier: correios)
v_correios3 = Vehicle.create!(plate: 'TXC-2222', brand: 'Pegeot', model: 'Partner', year: '2021', capacity: 3000, carrier: correios)

Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', deadline: 5, value: 10.05, carrier: dll)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'AC', deadline: 5, value: 15.75, carrier: dll)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PB', deadline: 5, value: 20.10, carrier: dll)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'PE', deadline: 7, value: 12.09, carrier: dll)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'AC', deadline: 7, value: 15.15, carrier: dll)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'PB', deadline: 7, value: 15.20, carrier: dll)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'PE', deadline: 8, value: 14.0, carrier: dll)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'AC', deadline: 8, value: 17.2, carrier: dll)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'PB', deadline: 8, value: 23.3, carrier: dll)

Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', deadline: 3, value: 10.06, carrier: pac)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'AC', deadline: 3, value: 10.75, carrier: pac)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PB', deadline: 3, value: 10.08, carrier: pac)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'PE', deadline: 5, value: 12.07, carrier: pac)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'AC', deadline: 5, value: 14.09, carrier: pac)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'PB', deadline: 5, value: 15.13, carrier: pac)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'PE', deadline: 3, value: 12.2, carrier: pac)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'AC', deadline: 3, value: 14.3, carrier: pac)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'PB', deadline: 3, value: 16.4, carrier: pac)

Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', deadline: 7, value: 8.05, carrier: correios)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'AC', deadline: 7, value: 9.75, carrier: correios)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PB', deadline: 7, value: 16.08, carrier: correios)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'PE', deadline: 8, value: 10.05, carrier: correios)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'AC', deadline: 8, value: 12.07, carrier: correios)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, state: 'PB', deadline: 8, value: 13.1, carrier: correios)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'PE', deadline: 9, value: 10.9, carrier: correios)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'AC', deadline: 9, value: 11.0, carrier: correios)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, state: 'PB', deadline: 9, value: 17.1, carrier: correios)

order_dll1 = Order.create!(zip_code: '50720-570', cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
  receiver_name: 'Madson kilder filho', receiver_cpf: '72315516699', receiver_phone: '11981316988', carrier: dll)
order_dll2 = Order.create!(zip_code: '69911-490', cubic_size: 0.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
  receiver_name: 'Bruno ferreira', receiver_cpf: '34215516699', receiver_phone: '45991316988', carrier: dll)
order_dll3 = Order.create!(zip_code: '58057-275', cubic_size: 0.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
 receiver_name: 'Leticia costa', receiver_cpf: '78215516699', receiver_phone: '90991316977', carrier: dll)

order_pac1 = Order.create!(zip_code: '50720-570', cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
  receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: pac)
order_pac2 = Order.create!(zip_code: '69911-490', cubic_size: 0.6, pickup_address: 'plablabla', receiver_address: 'plableblu',
  receiver_name: 'kilder ferreira', receiver_cpf: '12345678901', receiver_phone: '90881316988', carrier: pac)
order_pac3 = Order.create!(status: 2, zip_code: '58057-275', cubic_size: 1.7, pickup_address: 'plablabla', receiver_address: 'plableblu',
 receiver_name: 'Lucas Moura ferreira', receiver_cpf: '12215516699', receiver_phone: '90991456988', carrier: pac)

order_correios1 = Order.create!(zip_code: '50720-570', cubic_size: 0.8, pickup_address: 'blablabla', receiver_address: 'blableblu',
  receiver_name: 'Josue Silva filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: correios)
order_correios2 = Order.create!(zip_code: '69911-490', cubic_size: 1.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
  receiver_name: 'Marlene ferreira', receiver_cpf: '12345678901', receiver_phone: '90881316988', carrier: correios)
order_correios3 = Order.create!(status: 2, zip_code: '58057-275', cubic_size: 2.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
 receiver_name: 'Rafael Motta', receiver_cpf: '12215516699', receiver_phone: '90991456988', carrier: correios)

OrderUpdate.create!(order: order_dll1, date: '2022/12/05', hour: '6:30', last_location: 'Centro Tratamento DLL SP', next_location: 'Centro Tratamento DLL PE')
OrderUpdate.create!(order: order_dll1, date: '2022/12/11', hour: '10:30', last_location: 'Centro Tratamento DLL PE', next_location: 'Centro de distribuição Recife')
OrderUpdate.create!(order: order_dll1, date: '2022/12/13', hour: '15:30', last_location: 'Centro de distribuição Recife', next_location: 'entrega ao destinatario')

OrderUpdate.create!(order: order_pac1, date: '2022/06/05', hour: '5:30', last_location: 'Centro Tratamento Pac SP', next_location: 'Centro Tratamento Pac PE')
OrderUpdate.create!(order: order_pac1, date: '2022/06/11', hour: '8:30', last_location: 'Centro Tratamento Pac PE', next_location: 'Centro de distribuição Recife')
OrderUpdate.create!(order: order_pac1, date: '2022/06/13', hour: '10:30', last_location: 'Centro de distribuição Recife', next_location: 'entrega ao destinatario')

OrderUpdate.create!(order: order_correios1, date: '2022/07/06', hour: '10:30', last_location: 'Centro Tratamento dos Correios SP', next_location: 'Centro Tratamento dos Correios PE')
OrderUpdate.create!(order: order_correios1, date: '2022/07/13', hour: '15:30', last_location: 'Centro Tratamento dos Correios PE', next_location: 'Centro de distribuição Recife')
OrderUpdate.create!(order: order_correios1, date: '2022/07/15', hour: '17:30', last_location: 'Centro de distribuição Recife', next_location: 'entrega ao destinatario')

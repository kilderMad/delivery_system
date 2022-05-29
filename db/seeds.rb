# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

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

Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.05, carrier: dll)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 11, weight_max: 30, value_km: 0.075, carrier: dll)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 31, weight_max: 100, value_km: 0.10, carrier: dll)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 0, weight_max: 10, value_km: 0.09, carrier: dll)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 11, weight_max: 30, value_km: 0.15, carrier: dll)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 31, weight_max: 500, value_km: 0.20, carrier: dll)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 0, weight_max: 100, value_km: 1.0, carrier: dll)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 101, weight_max: 500, value_km: 1.2, carrier: dll)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 501, weight_max: 1000, value_km: 1.3, carrier: dll)

Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.06, carrier: pac)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 11, weight_max: 30, value_km: 0.075, carrier: pac)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 31, weight_max: 100, value_km: 0.08, carrier: pac)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 0, weight_max: 10, value_km: 0.07, carrier: pac)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 11, weight_max: 30, value_km: 0.09, carrier: pac)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 31, weight_max: 500, value_km: 0.13, carrier: pac)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 0, weight_max: 100, value_km: 1.2, carrier: pac)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 101, weight_max: 500, value_km: 1.3, carrier: pac)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 501, weight_max: 1000, value_km: 1.4, carrier: pac)

Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.05, carrier: correios)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 11, weight_max: 30, value_km: 0.075, carrier: correios)
Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 31, weight_max: 100, value_km: 0.08, carrier: correios)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 0, weight_max: 10, value_km: 0.05, carrier: correios)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 11, weight_max: 30, value_km: 0.07, carrier: correios)
Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 31, weight_max: 500, value_km: 0.1, carrier: correios)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 0, weight_max: 100, value_km: 0.9, carrier: correios)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 101, weight_max: 500, value_km: 1.0, carrier: correios)
Price.create!(cbm_min: 1.501, cbm_max: 5.500, weight_min: 501, weight_max: 1000, value_km: 1.1, carrier: correios)

Deadline.create!(distance_min: 0, distance_max: 600, time_arrive: 2, carrier: dll)
Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: dll)
Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: dll)
Deadline.create!(distance_min: 2001, distance_max: 4500, time_arrive: 15, carrier: dll)  

Deadline.create!(distance_min: 0, distance_max: 600, time_arrive: 3, carrier: pac)
Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: pac)
Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 6, carrier: pac)
Deadline.create!(distance_min: 2001, distance_max: 4500, time_arrive: 13, carrier: pac)

Deadline.create!(distance_min: 0, distance_max: 600, time_arrive: 4, carrier: correios)
Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 7, carrier: correios)
Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 12, carrier: correios)
Deadline.create!(distance_min: 2001, distance_max: 4500, time_arrive: 16, carrier: correios)

order_dll1 = Order.create!(distance: 2200, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
  receiver_name: 'Madson kilder filho', receiver_cpf: '72315516699', receiver_phone: '11981316988', carrier: dll)
order_dll2 = Order.create!( distance: 4000, weight: 45.0, cubic_size: 0.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
  receiver_name: 'Bruno ferreira', receiver_cpf: '34215516699', receiver_phone: '45991316988', carrier: dll)
order_dll3 = Order.create!(status: 2, distance: 1050, weight: 45.0, cubic_size: 0.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
 receiver_name: 'Leticia costa', receiver_cpf: '78215516699', receiver_phone: '90991316977', carrier: dll)

order_pac1 = Order.create!(distance: 3000, weight: 16.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
  receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: pac)
order_pac2 = Order.create!( distance: 1700, weight: 450.0, cubic_size: 0.6, pickup_address: 'plablabla', receiver_address: 'plableblu',
  receiver_name: 'kilder ferreira', receiver_cpf: '12345678901', receiver_phone: '90881316988', carrier: pac)
order_pac3 = Order.create!(status: 2, distance: 1000, weight: 85.0, cubic_size: 1.7, pickup_address: 'plablabla', receiver_address: 'plableblu',
 receiver_name: 'Lucas Moura ferreira', receiver_cpf: '12215516699', receiver_phone: '90991456988', carrier: pac)

order_correios1 = Order.create!(distance: 3000, weight: 6.0, cubic_size: 0.8, pickup_address: 'blablabla', receiver_address: 'blableblu',
  receiver_name: 'Josue Silva filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: correios)
order_correios2 = Order.create!( distance: 3700, weight: 105.0, cubic_size: 1.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
  receiver_name: 'Marlene ferreira', receiver_cpf: '12345678901', receiver_phone: '90881316988', carrier: correios)
order_correios3 = Order.create!(status: 2, distance: 1000, weight: 40.0, cubic_size: 2.5, pickup_address: 'plablabla', receiver_address: 'plableblu',
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
# READ

# Sistema de Delivery

- Sistema capaz de cadastrar transportadoras e designar ordens de serviço para tais.

- Transportadora pode cadastrar preços, prazos e veículos

- Trasportadora poderá aceitar ou não tais ordens de serviço, designar um veiculo, e deverá enviar atualizações de localidade do pacote.

- Visitante poderá consultar seu código de rastreio, onde irá visualizar as atualizações de transporte do pacote sempre que forem atualizadas

# Instruções de inicialização

bundle install
rails db:migrate
rails db:seed

para fazer login no sistema há 2 opções, admin ou usuario de transportadora

- ADM => email: admin@live.com, senha: password
- User DLL => email: joao123@dll.com.br, senha: password
- User Pac => email: kilder123@dll.com.br, senha: password
- User Correios => email: leticia123@dll.com.br, senha: password

# gems adicionais

- devise
- tailwindcss

# link do planejamento do projeto

https://github.com/kilderMad/delivery_system/projects/1
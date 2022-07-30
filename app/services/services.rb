class Services
  def self.ask_cep(zip_code)
    return false if zip_code.empty?

    response = Faraday.get("https://viacep.com.br/ws/#{zip_code}/json/")
    JSON.parse(response.body)['uf']
  end
end

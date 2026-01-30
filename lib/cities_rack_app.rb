class CitiesRackApp
  def self.call(env)
    cities = City.all.map { |c| { id: c.id, name: c.name } }

    [
      200,
      { "Content-Type" => "application/json" },
      [cities.to_json]
    ]
  end
end

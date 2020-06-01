require 'rest-client'
require 'json'

class PlanetsService

  def self.planet_films(planet)

    url = "https://swapi.dev/api/planets?search=#{planet.name}"
    resp = RestClient.get url

    films = JSON.parse(resp)["results"][0]["films"]

    return films

  end

end
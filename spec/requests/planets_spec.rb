require 'rails_helper'

RSpec.describe "Planets", type: :request do

  it "should be able to create a new planet" do
    planet = Planet.create(name: "Alderaan", climate: "temperate", terrain: "grasslands, mountains")
    get "/planets/#{planet.id}"
    expect(response).to have_http_status(200)
    expect(response.parsed_body).to match(planet.as_json)
  end

  it "should be able to list the planet" do
    planets = Planet.all
    get "/planets"
    expect(response).to have_http_status(200)
    expect(response.parsed_body).to match(planets.as_json)
  end

  it "should be able to find planets by id" do
    planet = Planet.first
    get "/planets/#{planet.id}"
    expect(response).to have_http_status(200)
    expect(response.parsed_body).to match(planet.as_json)
  end

  it 'should be able generate errors when trying to search for an unregistered planet by id' do
    get '/planets/1'
    expect(response).to have_http_status(:not_found)
  end

  it "should be able to find planets by name" do
    planet = Planet.find_by(name: 'Alderaan')
    planet.films = PlanetsService.planet_films(planet)
    get "/planets/name/#{planet.name}"
    expect(response).to have_http_status(200)
    expect(response.parsed_body).to include("_id", "climate", "name", "terrain", "films", "quantity_movies")
    expect(response.parsed_body["quantity_movies"]).to be(planet.films.length)
  end

  it 'should be able generate errors when trying to search for an unregistered planet by name' do
    get '/planets/name/Saturno'
    expect(response).to have_http_status(:not_found)
  end

  it "should be able to delete the planet" do
    planet = Planet.first
    delete "/planets/#{planet.id}"
    expect(response).to have_http_status(204)
  end
end

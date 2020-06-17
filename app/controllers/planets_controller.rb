class PlanetsController < ApplicationController

  # Criar um novo planeta
  def create
    @planet = Planet.new(planet_params)
    if @planet.save
      render json: @planet, status: :created
    else
      render json: @planet.erros, status: :unprocessable_entity
    end
  end

  # Listar todos os planetas
  def index
    @planets = Planet.all
    render json: @planets, status: :ok
  end

  # Listar planeta passando ID
  def show
    @planet = Planet.find(params[:id])
    render json: @planet, status: :ok
  end

  # Listar planeta passando nome
  def consult_name
    @planet = Planet.find_by(name: params[:name])
    @planet.films = PlanetsService.planet_films(@planet)
    render json: @planet.attributes.merge({films:@planet.films, quantity_movies: @planet.films.length})
  end

  # Excluir planeta
  def destroy
    @planet = Planet.find_by(id: params[:id])
    @planet.destroy
    render json: @planet, status: :no_content
  end

  # Parametros aceitos
  private
  def planet_params
    params.permit(:name, :climate, :terrain)
  end
end
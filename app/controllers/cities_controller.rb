class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  def new
    @city = City.new
  end

  def edit
  end

  def show
  end

  def index
    @cities = City.all
  end

  def delete
  end

  def create
    @city = City.new(city_params)
    if @city.save 
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new
    end
  end

  def update
    if @city.update(city_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_url, notice: 'Note was successfully destroyed.' 
  end
  end




   private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name,:id)
    end


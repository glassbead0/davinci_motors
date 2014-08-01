class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]


  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def edit

  end

  def show

  end

  def update

  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} has been created."

    if @car.save
      redirect_to cars_path, notice: creation_message
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to car_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:make, :model, :year, :price)
    end
end
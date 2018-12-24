class CarsController < ApplicationController
  def index
    @cars = Car.all
  end
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to @car, notice: "車両を登録しました。"
  end

  private

  def car_params
    params.reqire(:car).permit(:title, :price, :release_date, :description)
  end
end

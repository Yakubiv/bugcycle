class CarsController < ApplicationController
  protect_from_forgery except: :index

  def index
    @cars = Car.all

    respond_to do |format|
      format.html {}
      format.json do
        render json: @cars.to_json
      end
    end
  end

  def create
    @car = Car.create(car_params)
    render json: @car
  end

  def update

  end

  def destroy

  end

  private

  def car_params
    params.required(:car)
          .permit!
  end
end

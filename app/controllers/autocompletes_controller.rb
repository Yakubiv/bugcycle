class AutocompletesController < ApplicationController
  def index
    @bicycles = Bicycle.where('name ilike :text OR description ilike :text', text: "%#{params[:term]}%")
    render json: @bicycles.to_json
  end
end

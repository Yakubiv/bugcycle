class ManagesController < ApplicationController
  def show
    @bicycles = unless params[:type]
      current_user.bicycles.where(usage: true)
    else
      current_user.bicycles
    end
  end
end

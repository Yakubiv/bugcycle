class ManagesController < ApplicationController
  def show
    @bicycles = unless params[:type]
      current_user.bicycles
    else
      current_user.used_bicycles
    end
  end
end

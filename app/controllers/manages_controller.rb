class ManagesController < ApplicationController
  def show
    @bicycles = current_user.bicycles
  end
end

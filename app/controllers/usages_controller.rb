class UsagesController < ApplicationController
  def update
    @bicycle = Bicycle.find(params[:id])
    current_user.usages.create(bicycle_id: @bicycle.id)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render head: :ok }
    end
  end
end

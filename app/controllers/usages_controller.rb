class UsagesController < ApplicationController
  def update
    @bicycle = Bicycle.find(params[:id])
    @bicycle.update_column(:usage, true)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render head: :ok }
    end
  end
end

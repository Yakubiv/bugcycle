class ApprovesController < ApplicationController
  before_action :load_resources

  def create
    suggestion = MergeSuggestion.new(bicycle_id: @bicycle.id, suggestion_id: @suggestion.id)
    suggestion.approve
    redirect_to @bicycle, notice: 'Suggestion has been approved'
  end

  def destroy
    suggestion = MergeSuggestion.new(bicycle_id: @bicycle.id, suggestion_id: @suggestion.id)
    suggestion.disapprove
    redirect_to @bicycle, notice: 'Suggestion has been disapproved'
  end

  private

  def load_resources
    @bicycle = Bicycle.find(params[:bicycle_id])
    @suggestion = Suggestion.find(params[:suggestion_id])
  end
end

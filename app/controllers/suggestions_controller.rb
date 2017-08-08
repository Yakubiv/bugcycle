class SuggestionsController < ApplicationController
  before_action :load_suggestion, only: [:edit, :show, :destroy, :update]
  before_action :load_bicycle

  def show

  end

  def new
    @suggestion = Suggestion.new(old_bicycle_attrs)
  end

  def edit

  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      redirect_to @bicycle, notice: 'Your suggestion has been added'
    else
      render :new
    end
  end

  def update
    if @suggestion.update(suggestion_params)
      redirect_to @bicycle, notice: 'Suggestion has been updated'
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def load_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def load_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def suggestion_params
    params.require(:suggestion)
          .permit!
          .merge(user_id: current_user.id, bicycle_id: @bicycle.id)
  end

  def old_bicycle_attrs
    { name: @bicycle.name,
      image: @bicycle.image,
      description: @bicycle.description,
      category_id: @bicycle.category_id }
  end
end

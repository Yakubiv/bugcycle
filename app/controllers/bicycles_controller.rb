class BicyclesController < ApplicationController
  before_action :load_bicycle, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def edit
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    if @bicycle = current_user.bicycles.create(bicycles_params)
      redirect_to @bicycle, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @bicycle.update(bicycles_params)
      redirect_to @bicycle, notice: t('.success', bike: @bicycle)
    else
      render :edit
    end
  end

  def destroy
    @bicycle.destroy
    redirect_to manage_path, notice: t('.success', bike: @bicycle)
  end

  private

  def load_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def bicycles_params
    params.required(:bicycle)
          .permit!
  end
end

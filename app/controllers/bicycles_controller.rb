class BicyclesController < ApplicationController
  before_action :load_bicycle, only: [:show, :edit, :update, :destroy]

  def index
    # Could extract to query object. Bad smell
    @bicycles = Bicycle.includes(:category)
                        .where.not(id: current_user.used_bicycles.ids)
                        .page(params[:page]).per(2)
    @bicycles = @bicycles.joins(:category).where(categories: {name: params[:category]}) unless params[:category].blank?

    respond_to do |format|
      format.html {}
      format.js do
        @bicycles = @bicycles.where('name ilike :text OR description ilike :text', text: "%#{params[:text]}%")
      end
    end
  end

  def show
  end

  def edit
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new(bicycles_params.merge(user_id: current_user.id))
    if @bicycle.save
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

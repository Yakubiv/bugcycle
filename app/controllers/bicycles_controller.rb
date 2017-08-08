class BicyclesController < ApplicationController
  before_action :load_bicycle, only: [:show, :edit, :update, :destroy]

  def index
    @bicycles = BicyclesQuery.search(filter_params)
                             .page(params[:page]).per(2)

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

  def filter_params
    { category: params[:category],
      current_user: current_user }
  end

  def load_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def bicycles_params
    params.required(:bicycle)
          .permit!
  end
end

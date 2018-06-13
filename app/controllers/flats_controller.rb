class FlatsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = @user
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end
  def show
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def edit
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def destroy
     @flat = Flat.find(params[:id])
     authorize @flat
     user = @flat.user
     @flat.destroy
     redirect_to root_path
  end

  def update
      @flat = Flat.find(params[:id])
      authorize @flat
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price, :max_guests, :photo)
  end

  def set_user
   @user = current_user
  end


end

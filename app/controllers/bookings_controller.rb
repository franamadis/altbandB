class BookingsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def index
    @bookings = policy_scope(current_user.bookings)
  end

  def show
    @booking = Booking.find(params[:id])

  end


#   def new
#     @flat = Flat.find(params[:flat_id])
#     @booking = Booking.new
#   end

  def create
    @flat = Flat.find(params[:flat_id])
    @bookings = policy_scope(current_user.bookings)

    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.total = @booking.flat.price * @booking.period

      if @booking.save
      redirect_to booking_path(@booking)
    else
      render "bookings/new"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @flat = Flat.find(params[:flat_id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to booking_requests_path
    else
      render :edit
    end
  end


private

  def booking_params
    params.require(:booking).permit(:period, :total, :status, :guests, :flat_id, :user_id)
  end


end

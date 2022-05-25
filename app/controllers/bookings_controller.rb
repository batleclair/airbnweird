class BookingsController < ApplicationController
  before_action :set_friend, only: %i[create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.friend_id = @friend.id
    @booking.save
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_friend
    @friend = Friend.find(params[:friend_id])
  end
end

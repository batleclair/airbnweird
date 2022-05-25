class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friends = Friend.all.sample(8)
  end

  def dashboard
    @bookings = Booking.where(user_id: current_user.id)
    @own_friends = Friend.where(user_id: current_user.id)
  end
end

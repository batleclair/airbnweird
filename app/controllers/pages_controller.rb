class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friends = Friend.all.sample(8)
  end

  def dashboard
    @bookings = Booking.where(:user_id == current_user)
    @own_friends = Friend.where(:user == current_user)
    raise
    # @sales = Booking.where(@own_friends.find(:friend_id))
  end
end

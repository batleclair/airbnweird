class FriendsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show search]

  def index
    @friends = policy_scope(Friend)
    authorize @friends
  end

  def new
    @friend = Friend.new
    authorize @friend
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    authorize @friend
    if @friend.save
      redirect_to friend_path(@friend)
    else
      render :new
    end
  end

  def show
    @friend = Friend.find(params[:id])
    @booking = Booking.new
    authorize @friend
    @markers =
      [{
        lat: @friend.latitude,
        lng: @friend.longitude,
        info_window: render_to_string(partial: "info_window", locals: {friend: @friend})
      }]
  end

  def edit
    @friend = Friend.find(params[:id])
    authorize @friend
  end

  def update
    @friend = Friend.find(params[:id])
    @friend.update(friend_params)
    redirect_to new_user_friend_path(@friend)
    authorize @friend
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to friends_path, status: :see_other
    authorize @friend
  end

  private

  def friend_params
    params.require(:friend).permit(:name, :description, :category, :language, :price, :photo)
  end
end

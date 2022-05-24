class FriendsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show search]

  def index
    @friends = policy_scope(Friend)
    authorize @friends
  end

  def new
    authorize @friend
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.save
    redirect_to new_user_friend_path(@friend)
    authorize @friend
  end

  def show
    @friend = Friend.find(params[:id])
    authorize @friend
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def friend_params
    params.require(:friend).permit(:name, :description, :category, :language, :price)
  end
end

class FriendsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show search]
  before_action :set_user, only: [:show]

  def index
    authorize @friend
    @friends = Friend.all
  end

  def new
    authorize @friend
    @friend = Friend.new
  end

  def create
    authorize @friend
    @friend = Friend.new(friend_params)
    @friend.save
    redirect_to new_user_friend_path(@friend)
  end

  def show
    authorize @friend
    @friend = Friend.find(params[:id])
  end

  def edit
    authorize @friend
    @friend = Friend.find(params[:id])
  end

  def update
    authorize @friend
    @friend = Friend.find(params[:id])
    @friend.update(friend_params)
    redirect_to new_user_friend_path(@friend)
  end

  def destroy
    authorize @friend
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to friends_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def friend_params
    params.require(:friend).permit(:name, :description, :category, :language, :price)
  end
end

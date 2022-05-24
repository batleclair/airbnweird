class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.save
    redirect_to friend_path(@friend)
  end

  private

  def friend_params
    params.require(:friend).permit(:name, :description, :category, :language, :price)
  end
end

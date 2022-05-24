class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friends = Friend.all.sample(8)
  end
end

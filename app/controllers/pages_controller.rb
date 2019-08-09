class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      @minipost = current_user.miniposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end

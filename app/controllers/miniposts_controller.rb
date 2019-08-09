class MinipostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @user = User.new
    @minipost = current_user.miniposts.build(minipost_params)
    if @minipost.save
      flash[:success] = "Minipost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @minipost.destroy
    flash[:success] = "Minipost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def minipost_params
    params.require(:minipost).permit(:content, :picture)
  end

  def correct_user
    @minipost = current_user.miniposts.find_by(id: params[:id])
    redirect_to root_url if @minipost.nil?
  end
end

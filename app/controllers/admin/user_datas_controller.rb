class Admin::UserDatasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :favorite_movie, :profile_image, :user_status)
  end
end

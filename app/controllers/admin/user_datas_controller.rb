class Admin::UserDatasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @movies = @user.movies.order(created_at: :desc) #ユーザーの投稿一覧（新しい順）
    @genres = Genre.all
    @good = Good.new
    goods = Good.where(user_id: @user.id).pluck(:movie_id) #ユーザーがgoodした投稿一覧
    @good_movies = Movie.find(goods)
  end


  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :favorite_movie, :profile_image, :user_status)
  end
end

class UsersController < ApplicationController
  before_action :check_login
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @movies = @user.movies.order(created_at: :desc) #ユーザーの投稿一覧（新しい順）
    @genres = Genre.all
    @good = Good.new
    goods = Good.where(user_id: @user.id).pluck(:movie_id) #ユーザーがgoodした投稿一覧
    @good_movies = Movie.find(goods)
  end

  def timeline
    @movies = Movie.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc) #フォローしているユーザーと自分の投稿を新しい順で表示
    @good = Good.new
    @genres = Genre.all
  end

  def edit #ユーザー情報編集
    @user = User.find(params[:id])
    @genres = Genre.all
  end

  def update #ユーザー情報編集
    @user = current_user
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
       @genres = Genre.all
       redirect_to edit_user_path, alert: "名前は必須です。"
    end
  end

  def check_login
    redirect_to logout_path if current_user && current_user.user_status != 'active'
  end

  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :favorite_movie, :profile_image, :user_status)
  end
end

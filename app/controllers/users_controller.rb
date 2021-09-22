class UsersController < ApplicationController
  def show #ユーザー詳細・タイムライン・検索
    @user = User.find(params[:id])
    @movies = @user.movies
    @followings = Movie.where(user_id: [*current_user.following_ids])
    @genres = Genre.all
    @good = Good.new
  end

  def movies #ユーザー詳細・投稿一覧表示・検索
    @user = User.find(params[:id])
    @movies = @user.movies
    @followings = Movie.where(user_id: [*current_user.following_ids])
    @genres = Genre.all
    @good = Good.new
  end

  def goods #ユーザー詳細・good一覧・検索
    @user = User.find(params[:id])
    goods = Good.where(user_id: @user.id).pluck(:movie_id)
    @good_movies = Movie.find(goods)
    @followings = Movie.where(user_id: [*current_user.following_ids])
    @genres = Genre.all
    @good = Good.new
  end

  def edit #ユーザー情報編集
    @user = User.find(params[:id])
  end

  def update #ユーザー情報編集
    @user = current_user
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
       render :edit
    end
  end

  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :favorite_movie, :profile_image)
  end
end

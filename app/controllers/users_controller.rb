class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.movies
    @genres = Genre.all
    @good = Good.new
    goods = Good.where(user_id: @user.id).pluck(:movie_id)
    @good_movies = Movie.find(goods)
  end

  def timeline
    @followings = Movie.where(user_id: [*current_user.following_ids])
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
       render :edit
    end
  end

  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :favorite_movie, :profile_image)
  end
end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.movies
    @followings = Movie.where(user_id: [*current_user.following_ids])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
       render :edit
    end
  end



  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :favorite_movie)
  end
end

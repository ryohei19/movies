class MoviesController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to user_path(current_user)
    else
      @genres = Genre.all
      redirect_to new_movie_path, alert: "※がついている項目は必須です。"
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @user = @movie.user
    @movies = @user.movies
    @good = Good.new
    @genres = Genre.all
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to user_path(current_user)
  end


  private
  def movie_params
  	  params.require(:movie).permit(:name, :rate, :review, :spoiler, :genre_id)
  end
end

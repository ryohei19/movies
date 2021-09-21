class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    @movie.save
    redirect_to user_path(current_user)
  end

  def index
  end

  def show
    @movie = Movie.find(params[:id])
    @user = @movie.user
    @movies = @user.movies
    @good = Good.new
    @genres = Genre.all
  end


  private
  def movie_params
  	  params.require(:movie).permit(:name, :rate, :review, :spoiler, :genre_id)
  end
end

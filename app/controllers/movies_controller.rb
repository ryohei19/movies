class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to user_path(current_user.id)
  end

  private
  def movie_params
  	  params.require(:movie).permit(:name, :star, :review, :spoiler, :user_id, :genre_id)
  end
end

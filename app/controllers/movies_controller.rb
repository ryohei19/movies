class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  private
  def movie_params
  	  params.require(:movie).permit(:name, :star, :review, :spoiler, :user_id, :genre_id)
  end
end

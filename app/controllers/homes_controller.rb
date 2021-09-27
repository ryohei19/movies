class HomesController < ApplicationController
  def top
    @movies = Movie.all
    @genres = Genre.all
  end
end

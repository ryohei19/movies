class HomesController < ApplicationController
  def top
    @movies = Movie.all.order(created_at: :desc) #新しい順
    @genres = Genre.all
  end
end

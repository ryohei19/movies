class GoodsController < ApplicationController
  def create
    @good = current_user.goods.create(movie_id: params[:movie_id])
    @movie = Movie.find(params[:movie_id])
    @movie.create_notification_good!(current_user) #通知
  end

  def destroy
    @good = Good.find(params[:id])
    @movie = Movie.find(params[:movie_id])
    @good.destroy
  end
end

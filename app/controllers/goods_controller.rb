class GoodsController < ApplicationController
  def create
    @good = current_user.goods.create(movie_id: params[:movie_id])
    @movie = Movie.find(params[:movie_id])
    @movie.create_notification_good!(current_user) #通知
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @good = Good.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @good.destroy
    redirect_back(fallback_location: root_path)
  end
end

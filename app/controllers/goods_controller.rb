class GoodsController < ApplicationController
  def create
    @good = current_user.goods.create(movie_id: params[:movie_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @good = Good.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @good.destroy
    redirect_back(fallback_location: root_path)
  end
end

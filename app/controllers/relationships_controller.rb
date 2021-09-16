class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id]) #フォローをする
    redirect_to request.referer #遷移元へ
  end

  def destroy
    current_user.unfollow(params[:user_id]) #フォローを外す
    redirect_to request.referer #遷移元へ
  end

  def followings #フォロー一覧
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def follwers #フォロワー一覧
    user = User.find(params[:user_id])
    @users = user.followers
  end
end

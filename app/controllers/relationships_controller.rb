class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id]) #フォローをする
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user) #通知
    redirect_to request.referer #遷移元へ
  end

  def destroy
    current_user.unfollow(params[:user_id]) #フォローを外す
    redirect_to request.referer #遷移元へ
  end

  def followings #フォロー一覧
    @user = User.find(params[:user_id])
    @users = @user.followings
    @followings = Movie.where(user_id: [*current_user.following_ids])
    @genres = Genre.all
    @good = Good.new
  end

  def followers #フォロワー一覧
    @user = User.find(params[:user_id])
    @users = @user.followers
    @followings = Movie.where(user_id: [*current_user.following_ids])
    @genres = Genre.all
    @good = Good.new
  end
end

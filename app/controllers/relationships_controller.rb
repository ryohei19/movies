class RelationshipsController < ApplicationController
  before_action :authenticate_user!

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

  def index #フォロー・フォロワー一覧
    @user = User.find(params[:user_id])
    @followings = @user.followings
    @followers = @user.followers
    @genres = Genre.all
  end

end

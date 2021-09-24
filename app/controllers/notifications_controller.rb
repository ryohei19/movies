class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @user = current_user
    @movies = @user.movies
    @genres = Genre.all
  end
end
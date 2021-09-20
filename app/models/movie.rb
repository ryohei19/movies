class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :goods
  has_many :good_users, through: :goods, source: :user
  has_many :notifications, dependent: :destroy

#--いいねされた時の通知--
  def create_notification_good!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and movie_id = ? and action = ? ", current_user.id, user_id, id, 'good'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        movie_id: id,
        visited_id: user_id,
        action: 'good'
      )
      # 自分の投稿に対し自分でいいねしたの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

#--フォローされた時の通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end

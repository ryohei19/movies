module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    case notification.action
    when 'follow'
      tag.a(notification.visitor.name, href: user_path(@visitor)) + '　があなたをフォローしました'
    when 'good'
      tag.a(notification.visitor.name, href: user_path(@visitor)) + '　があなたの投稿にいいねしました'
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end

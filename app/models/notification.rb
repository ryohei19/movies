class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }   #作成日時の降順で表示させるようにする（常に新しい通知からデータを取得）
  belongs_to :movie, optional: true
  belongs_to :visitor, class_name: "User", foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: "User", foreign_key: "visited_id", optional: true
end

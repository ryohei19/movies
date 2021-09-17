class Good < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates_uniqueness_of :movie_id, scope: :user_id #ひとつの投稿に対してひとつしかgoodできない
end

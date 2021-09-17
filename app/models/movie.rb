class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :goods
  has_many :good_users, through: :goods, source: :user
end

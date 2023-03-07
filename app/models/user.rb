class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships # to get the friendships you requested
  has_many :friends, through: :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: :friend_id # to get the friendships someone else sent to you
  has_many :received_friends, through: :received_friendships, source: :user
end

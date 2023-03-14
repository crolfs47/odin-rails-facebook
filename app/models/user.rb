class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :full_name, presence: true
  validates :email, uniqueness: true
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # To get friendships current user requested
  has_many :friendships, dependent: :destroy 
  # has_many :friends, through: :friendships, dependent: :destroy
  has_many :accepted_friends_sent, -> { merge(Friendship.accepted) }, through: :friendships, source: :friend
  has_many :pending_friends_sent, -> { merge(Friendship.pending) }, through: :friendships, source: :friend

  # To get friendships someone else sent to current user
  has_many :received_friendships, class_name: "Friendship", foreign_key: :friend_id, dependent: :destroy 
  # has_many :received_friends, through: :received_friendships, source: :user, dependent: :destroy
  has_many :accepted_friends_rec, -> { merge(Friendship.accepted) }, through: :received_friendships, source: :user
  has_many :pending_friends_rec, -> { merge(Friendship.pending) }, through: :received_friendships, source: :user
end

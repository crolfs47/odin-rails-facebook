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
  has_many :notifications, dependent: :destroy

  # To get friendships current user requested
  has_many :friendships, dependent: :destroy 
  has_many :accepted_friends_sent, -> { merge(Friendship.accepted) }, through: :friendships, source: :friend
  has_many :pending_friends_sent, -> { merge(Friendship.pending) }, through: :friendships, source: :friend

  # To get friendships someone else sent to current user
  has_many :received_friendships, class_name: "Friendship", foreign_key: :friend_id, dependent: :destroy 
  has_many :accepted_friends_rec, -> { merge(Friendship.accepted) }, through: :received_friendships, source: :user
  has_many :pending_friends_rec, -> { merge(Friendship.pending) }, through: :received_friendships, source: :user

  has_one_attached :avatar

  def accepted_friendships
    friendships.accepted + received_friendships.accepted
  end

  def friends
    accepted_friends_sent + accepted_friends_rec
  end

  def pending_friends
    pending_friends_sent + pending_friends_rec
  end

  def find_friendship(user)
    Friendship.find_by(user_id: self.id, friend_id: user.id) || Friendship.find_by(user_id: user.id, friend_id: self.id)
  end

  def liked_post?(post)
    likes.where(post_id: post.id).exists?
  end

end

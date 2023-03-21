class Post < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def find_like(user)
    likes.find_by(user: user)
  end
end

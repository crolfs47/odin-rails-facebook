class Comment < ApplicationRecord
  validates :comment, presence: true
  
  belongs_to :post
  belongs_to :user
  has_many :notifications, as: :notifiable
end

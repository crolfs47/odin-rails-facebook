class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy
end

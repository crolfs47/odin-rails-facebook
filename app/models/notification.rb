class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read: nil) }
  scope :friendships, -> { where(action: 'friendship') }
  scope :likes, -> { where(action: 'like') }
  scope :comments, -> { where(action: 'comment') }
end

class Event < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :host, class_name: 'User'
  has_many :rsvps, dependent: :destroy
  has_many :attendees, through: :rsvps, dependent: :destroy

  scope :upcoming, -> { where('date >= ?', Date.today).order(date: :asc) }
  scope :past, -> { where('date < ?', Date.today).order(date: :desc) }
end

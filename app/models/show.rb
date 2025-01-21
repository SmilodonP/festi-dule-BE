class Show < ApplicationRecord
  belongs_to :artist
  belongs_to :stage
  has_many :user_shows
  has_many :users, through: :user_shows

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, 'must be after the start time')
    end
  end
end

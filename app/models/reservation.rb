class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet
  belongs_to :movie, optional: true

  validates :theater_id, uniqueness: { scope: [:screen_id, :sheet_id, :schedule_id, :date] }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end

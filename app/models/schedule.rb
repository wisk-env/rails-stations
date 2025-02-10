class Schedule < ApplicationRecord
  belongs_to :movie
  has_many :reservations
  has_many :sheets
  has_many :theaters
end

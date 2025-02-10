class Theater < ApplicationRecord
  has_many :screens
  has_many :schedules
end

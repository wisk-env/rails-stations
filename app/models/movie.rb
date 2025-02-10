class Movie < ApplicationRecord
  validates :name, uniqueness: true

  has_many :schedules
  has_many :reservations

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "image_url", "is_showing", "name", "updated_at", "year"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.search(keyword)
    if keyword.present?
      where('name LIKE ? or description LIKE ?', "%#{keyword}%", "%#{keyword}%")
    else
      all
    end
  end
end

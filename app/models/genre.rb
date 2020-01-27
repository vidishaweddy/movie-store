class Genre < ApplicationRecord
  has_and_belongs_to_many :movies

  validates :name, presence: true

  def to_s
    name
  end

  def self.search(query)
    return self.all if query.blank?
    Genre.where('name ILIKE :query', query: "%#{query}%")
  end
end

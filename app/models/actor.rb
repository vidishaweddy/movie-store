class Actor < ApplicationRecord
  has_and_belongs_to_many :movies

  validates :first_name, presence: true

  def full_name
    first_name << " " << last_name
  end

  def to_s
    full_name
  end

  def self.search(query)
    return self.all if query.blank?
    Actor.where('.first_name ILIKE :query OR last_name ILIKE :query', query: "%#{query}%")
  end
end

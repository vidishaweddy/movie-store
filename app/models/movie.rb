class Movie < ActiveRecord::Base
  mount_uploader :poster, PosterUploader
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :actors
  accepts_nested_attributes_for :actors, reject_if: :value_blank, allow_destroy: true

  validates :title, :release_year, :description, :imdb_id, :rating, :price, :quantity, :filetype, presence: true
  validates_processing_of :poster
  validate :poster_size_validation

  register_currency :aud

  monetize :price_cents

  def value_blank(a)
    valid? && a[:first_name].blank?
  end

  def imdb
    "http://www.imdb.com/title/#{imdb_id}/"
  end

  def self.search(query)
    return self.all if query.blank?
    Movie.includes(:actors, :genres).where('title ILIKE :query
OR description_name ILIKE :query
OR actors.first_name ILIKE :query
OR actors.last_name ILIKE :query
OR genres.name ILIKE :query', query: "%#{query}%").references(:actors, :genres)
  end

  def poster_size_validation
    errors[:poster] << "should be less than 500KB" if poster.size > 0.5.megabytes
  end

  def to_s
    title
  end
end

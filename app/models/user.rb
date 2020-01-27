class User < ApplicationRecord
  has_many :carts
  has_many :movies, through: :carts
  PASSWORD_FORMAT = /\A
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validate :password_complexity
  validates :first_name, :last_name, :address, :age, :dob, presence: true, on: :update
  validates :first_name, :last_name, presence: true, on: :create

  def password_complexity
    if password.present? and not password.match(PASSWORD_FORMAT)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, one symbol, and one digit"
    end
  end

  def admin?
    self.admin == true
  end

  def to_s
    email
  end

  def self.search(query)
    return self.all if query.blank?
    User.where('email ILIKE :query
OR first_name ILIKE :query
OR last_name ILIKE :query
OR dob ILIKE :query
OR address ILIKE :query
OR age ILIKE :query', query: "%#{query}%")
  end


    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_admin

  private
  def set_admin
    if  User.count == 0
      self.admin = true
    end
  end
end


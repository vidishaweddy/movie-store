class Cart < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :quantity, :movie_id, :user_id, presence: true

  before_create :add_timestamp
  after_create :send_email, :send_email_return_notification, :send_email_late_notification, :update_quantity

  def send_email
    CartMailer.receiptmail(self).deliver_now
  end

  def send_email_return_notification
    CartMailer.notificationmail(self).deliver_later(wait: 1.day)
  end

  def send_email_late_notification
    CartMailer.latemail(self).deliver_later(wait: 2.days)
  end

  def add_timestamp
    self.rent_at = Time.now
    self.return_at = Time.now + 2.days
  end

  def update_quantity
    @movie = Movie.find(self.movie_id)
    @quantity = @movie.quantity - self.quantity
    @movie.quantity = @quantity
    @movie.save
  end
end

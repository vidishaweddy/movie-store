# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/cart_mailer/cart_mailer
  def cart_mailer
    CartMailer.cart_mailer
  end

end

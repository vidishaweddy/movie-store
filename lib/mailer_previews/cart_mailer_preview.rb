class CartMailerPreview < ActionMailer::Preview

  def receiptmail
    cart = Cart.last
    CartMailer.receiptmail(cart,cart.user)
  end

  def notificationmail
    cart = Cart.last
    CartMailer.notificationmail(cart,cart.user)
  end

  def latemail
    cart = Cart.last
    CartMailer.latemail(cart,cart.user)
  end

end

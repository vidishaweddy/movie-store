require 'sidekiq'
class CartMailer < ApplicationMailer

  include Sidekiq::Extensions
  def receiptmail(cart)
    @cart = cart
    @user = @cart.user
    @movie = @cart.movie
    attachments["receipt_#{@cart.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'receipt', template: 'receipts/show', layout: 'pdf.html'))
    mail(to: @user.email, subject: "Receipt of the Movie Rental")
  end

  def notificationmail(cart)
    @cart = cart
    @user = @cart.user
    @movie = @cart.movie
    if @cart.quantity > 0
      mail(to: @user.email, subject: "Notification from the Movie Rental")
    end
  end

  def latemail(cart)
    @cart = cart
    @user = @cart.user
    @movie = @cart.movie
    if @cart.quantity > 0
      mail(to: @user.email, subject: "Notification of a Late Movie Return")
    end
  end
end

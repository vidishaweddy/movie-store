require 'test_helper'

class CartMailerTest < ActionMailer::TestCase
  test "cart_mailer" do
    mail = CartMailer.cart_mailer
    assert_equal "Cart mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

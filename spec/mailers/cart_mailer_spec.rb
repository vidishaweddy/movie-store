require "rails_helper"

RSpec.describe CartMailer, type: :mailer do
  describe 'Receipt Mail' do
    user = FactoryGirl.create(:users)
    movie = FactoryGirl.create(:movie)
    carts = FactoryGirl.build(:cart)
    cart = Cart.new(
      quantity: carts.quantity,
      return_at: carts.return_at,
      rent_at: carts.rent_at,
      user: user,
      movie: movie)
    let(:mail) { CartMailer.receiptmail(cart).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Receipt of the Movie Rental')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['no-reply@moviestore.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(movie.title)
    end

    it 'has attachment' do
      attachment = mail.attachments[0]
      expect(attachment).to be_a_kind_of(Mail::Part)
      expect(attachment.filename).to include('receipt')
      expect(attachment.content_type).to be_start_with('application/pdf')
    end
  end

  describe 'Notification Mail' do
    user = FactoryGirl.create(:users)
    movie = FactoryGirl.create(:movie)
    carts = FactoryGirl.build(:cart)
    cart = Cart.new(
      quantity: carts.quantity,
      return_at: carts.return_at,
      rent_at: carts.rent_at,
      user: user,
      movie: movie)
    let(:mail) { CartMailer.notificationmail(cart).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Notification from the Movie Rental')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['no-reply@moviestore.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(movie.title)
    end
  end

  describe 'Late Mail' do
    user = FactoryGirl.create(:users)
    movie = FactoryGirl.create(:movie)
    carts = FactoryGirl.build(:cart)
    cart = Cart.new(
      quantity: carts.quantity,
      return_at: carts.return_at,
      rent_at: carts.rent_at,
      user: user,
      movie: movie)
    let(:mail) { CartMailer.latemail(cart).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Notification of a Late Movie Return')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['no-reply@moviestore.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(movie.title)
    end
  end
end

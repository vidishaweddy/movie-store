require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:users)).to be_valid
  end

  it "is valid with a f_name, l_name, age, dob, address, email, password" do
    user = User.new(
      first_name: 'A',
      last_name: 'B',
      age: '20',
      dob: '2017-05-31',
      address: 'a',
      email: 'a@a.com',
      password: '*Abcd123456')
    expect(user).to be_valid
  end

  it "is invalid without a f_name" do
    user = User.new(
      first_name: nil
    )
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a l_name" do
    user = User.new(
      last_name: nil
    )
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid with wrong password requirement" do
    user = User.new(
      password: 'Abcd123456'
    )
    user.valid?
    expect(user.errors[:password]).to include("must include at least one lowercase letter, one uppercase letter, one symbol, and one digit")
  end
end

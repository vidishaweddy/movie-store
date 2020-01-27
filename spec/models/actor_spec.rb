require 'rails_helper'

describe Actor do
  it "has a valid factory" do
    expect(FactoryGirl.build(:actor)).to be_valid
  end

  it "is valid with a name and dob" do
    actor = Actor.new(
      first_name: 'A',
      last_name: 'B',
      dob: '2017-05-31')
    expect(actor).to be_valid
  end

  it "is invalid without a name" do
    actor = Actor.new(
      first_name: nil
    )
    actor.valid?
    expect(actor.errors[:first_name]).to include("can't be blank")
  end
end

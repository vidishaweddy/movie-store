require 'rails_helper'

describe 'User Information Edit' do

  it "shows update text" do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit edit_user_registration_path
    login_as(user)
    fill_in 'user_first_name', with: 'a'
    fill_in 'user_last_name', with: 'a'
    fill_in 'user_address', with: 'a'
    fill_in 'user_age', with: '1'
    fill_in 'user_dob', with: '2017-05-17'
    fill_in 'user_current_password', with: user.password
    click_button 'Update'
    expect(page).to have_content "Your account has been updated successfully."
  end
end

describe 'User Failed login' do

  user = FactoryGirl.build(:user)

  before :each do
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Log in'
  end

  it "shows register page" do
    expect(page).to have_content "Invalid Email or password"
  end
end

describe 'User Succesful login' do

  user = FactoryGirl.build(:user)

  before :each do
    login_as(user)
    visit movies_path
  end

  it "shows index page" do
    expect(page).to have_content user.email
  end
end

require 'rails_helper'

describe 'User Succesful registration' do
  user = FactoryGirl.build(:user)

  before :each do
    visit new_user_registration_path

    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Sign up'
  end

  it "shows welcome text" do
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end

describe 'User failed registration (password 1)' do
  user = FactoryGirl.build(:user)

  before :each do
    visit new_user_registration_path

    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Abcd123456'
    fill_in 'user_password_confirmation', with: 'Abcd123456'

    click_button 'Sign up'
  end

  it "shows password requirement" do
    expect(page).to have_content "must include at least"
  end
end

describe 'User failed registration (password 2)' do
  user = FactoryGirl.build(:user)

  before :each do
    visit new_user_registration_path

    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: '*Ab12'
    fill_in 'user_password_confirmation', with: '*Ab12'

    click_button 'Sign up'
  end

  it "shows password requirement" do
    expect(page).to have_content "8 characters minimum"
  end
end

describe 'User failed registration (email)' do
  user = FactoryGirl.build(:user)

  before :each do
    visit new_user_registration_path

    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: 'a'
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation

    click_button 'Sign up'
  end

  it "shows password requirement" do
    expect(page).to have_content "Email is invalid"
  end
end

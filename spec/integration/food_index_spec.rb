require 'rails_helper'

RSpec.describe 'Food Index', type: :system do
  before(:each) do
    @user = User.create(name: 'anye3', email: 'wolo22001@gmail.com', password: '2e2010510',
                        password_confirmation: '2e2010510')
    @food = Food.create(user_id: @user.id, name: 'pizza', measurement_unit: 'grams', price: '200', quantity: '3')
  end


  it 'Sign up with a user' do
    visit new_user_registration_path

    sleep(1)
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    sleep(2)
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password_confirmation
    click_button 'Sign up'
  end


  it 'User should log in' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    sleep(2)
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    sleep(5)
  end

  it 'User should log in' do
    visit root_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    sleep(4)
    click_button 'Log in'
    assert_text 'Foods'
    click_on 'Foods'
    sleep(2)
    click_link('Post form')

    fill_in 'Name', with: @food.name
    sleep(3)
    fill_in 'Measurement unit', with: @food.measurement_unit
    fill_in 'Price', with: @food.price
    fill_in 'Quantity', with: @food.quantity

    click_button 'Add food'
  end
end

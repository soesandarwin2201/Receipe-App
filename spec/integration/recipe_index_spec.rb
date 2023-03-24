require 'rails_helper'

RSpec.describe 'Recipe Index', type: :system do
  before(:each) do
    @user = User.create(name: 'anye3', email: 'wolo22001@gmail.com', password: '2e2010510',
                        password_confirmation: '2e2010510')
    @recipe = Recipe.create(user_id: @user.id, name: 'pizza', preparation_time: '2hours', cooking_time: '3hours',
                            description: 'good', public: true)
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
    assert_text 'Recipes'
    click_on 'Recipes'
    sleep(2)
    click_link('Add new form')

    fill_in 'Name', with: @recipe.name
    sleep(3)
    fill_in 'Preparation time', with: @recipe.preparation_time
    fill_in 'Cooking time', with: @recipe.cooking_time
    fill_in 'Description', with: @recipe.description

    click_button 'Create Recipe'
  end
end

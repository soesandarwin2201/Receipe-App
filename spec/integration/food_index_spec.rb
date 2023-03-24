require 'rails_helper'

RSpec.describe 'Test for the food index page',type: :system do 
 describe 'check the content and link for the food index page ' do 
  before(:each) do 
   @user = User.create(name: 'soe', email: 'soesandarwin2201@gmail.com', password: '22010510')
   @food = Food.create(user: @user, name: 'pizza', measurement_unit: 'grams', price: '200', quantity: '3')

   visit foods_path
  end

  it 'User should see the food table and name' do 
   expect(page).to have_content('Sign up')
 end
end
end
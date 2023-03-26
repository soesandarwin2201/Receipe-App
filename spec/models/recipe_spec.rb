require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe model' do
    let(:user) { User.create(name: 'soe', email: 'soesandarwin2201@gmail.com', password: '22010510') }
    let(:recipe) do
      Recipe.new(user:, name: 'pizza', preparation_time: '3', cooking_time: '2', description: 'it is good',
                 public: true)
    end

    before { recipe.save }

    it 'check the name is not blank' do
      recipe.name = 'pizza'
      expect(recipe).to be_valid
    end

    it 'check the preparation_time is not blank' do
      recipe.preparation_time = '3'
      expect(recipe).to be_valid
    end

    it 'check the cooking is not blank' do
      recipe.cooking_time = '2'
      expect(recipe).to be_valid
    end

    it 'check the description is not blank' do
      recipe.description = 'it is good'
      expect(recipe).to be_valid
    end
  end
end

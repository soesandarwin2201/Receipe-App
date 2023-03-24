require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'Alice') }
  let(:food) { Food.new(name: 'Bobby', measurement_unit: 'kg', price: 1.99, quantity: 0.5, user_id: user.id) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:measurement_unit) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
  end

  describe 'associations' do
    it { should belong_to(:user).with_foreign_key('user_id') }
    it { should have_many(:recipe_food) }
    it { should have_many(:recipes) }
  end

  describe '#new' do
    it 'creates a new food with the correct attributes' do
      expect(food.name).to eq('bobby')
      expect(food.measurement_unit).to eq('kg')
      expect(food.price).to eq(1.99)
      expect(food.quantity).to eq(0.5)
      expect(food.user_id).to eq(user.id)
    end
  end
end

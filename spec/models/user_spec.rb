require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    let(:user) { User.create(name: 'soe', email: 'soesandarwin2201@gmail.com', password: '22010510') }

    before { user.save }

    it 'check the name is not blank' do
      user.name = 'soe'
      expect(user).to be_valid
    end

    it 'check the measurement unit is not blank' do
      user.email = 'soesandarwin2201@gmail.com'
      expect(user).to be_valid
    end
  end
end

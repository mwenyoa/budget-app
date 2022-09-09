require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create!(name: 'Anthony', email: 'mwenyo@gmail.com', password: 'password1',
                         password_confirmation: 'password1')
    @category = Category.new(name: 'Category 1', user_id: @user.id)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      @category.save
      expect(@category).to be_valid
    end
    it 'Invalid without a name' do
      expect(Category.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many payments' do
      assc = described_class.reflect_on_association(:payments)
      expect(assc.macro).to eq :has_many
    end
    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end

require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.create(name: 'Anthony', email: 'mwenyo@gmail.com', password: 'password1',
                        password_confirmation: 'password1')
    @category = Category.create(name: 'Pizza', user_id: @user.id)
    @payment = Payment.new(name: 'Transaction 1', amount: 200, user_id: @user.id, category_id: @category.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      @payment.save
      expect(@payment).to be_valid
    end

    it 'Invalid without a name' do
      @payment.name = nil
      expect(@payment).to_not be_valid
    end

    it 'Invalid without a Amount' do
      @payment.amount = nil
      expect(@payment).to_not be_valid
    end

    it 'Should have amount of 200' do
      @payment.save
      expect(@payment.amount).to eq(200)
    end
  end

  describe 'associations' do
    it 'belongs to users' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end

class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, through: :category_transactions
end

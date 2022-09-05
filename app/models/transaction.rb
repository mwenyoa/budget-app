class Transaction < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :category_transactions
end

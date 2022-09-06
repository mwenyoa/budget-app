class Transaction < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :category_transactions, dependent: :destroy

  # validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

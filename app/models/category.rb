class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, through: :category_transactions, dependent: :destroy
  has_one_attached :icon

  # validations
  validates :name, :icon, presence: true
end

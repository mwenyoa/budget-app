class Payment < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  # validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :delete_all
  has_one_attached :icon

  # validations
  validates :name, presence: true
end

class Food < ApplicationRecord
  validates :name, precense: true
  validates :measurement_unit, precense: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end

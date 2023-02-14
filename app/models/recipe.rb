class Recipe < ApplicationRecord
  validates :name, precense: true
  validates :preparation_time, precense: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :cooking_time, precense: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :description, presence: true
  
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end

class User < ApplicationRecord
  ROLES = %i[admin user].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
end

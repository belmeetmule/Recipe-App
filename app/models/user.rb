class User < ApplicationRecord
    validates :name, precense: true 
    
    has_many :foods, dependent: :destroy
    has_many :recipes, dependent: :destroy
end

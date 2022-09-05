class Material < ApplicationRecord
  has_one :ingredient
  belongs_to :recipe
  has_many :units
end

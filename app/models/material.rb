class Material < ApplicationRecord
  has_one :ingredient
  belongs_to :recipe, optional: true
  has_many :units
end

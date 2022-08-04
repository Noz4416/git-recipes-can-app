class Material < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  has_many :units
end

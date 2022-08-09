class Material < ApplicationRecord
  belongs_to :ingredient
  has_many :units
end

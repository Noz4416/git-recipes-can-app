class Foodstuff < ApplicationRecord

  belongs_to :recipe
  belongs_to :nutrition
  has_many :units
end

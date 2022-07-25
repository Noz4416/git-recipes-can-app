class Foodstuff < ApplicationRecord

  belongs_to :recipe
  has_many :nutritions
  has_many :units
end

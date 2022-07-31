class Nutrition < ApplicationRecord

  has_many :foodstuffs, dependent: :destroy
  has_many :recipes, through: :foodstuffs, dependent: :destroy
  accepts_nested_attributes_for :foodstuffs
end

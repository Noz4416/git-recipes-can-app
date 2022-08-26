class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :material, optional: true

  validates :name, presence: true
  validates :amount, presence: true

  enum unit: Settings.units.to_h
end

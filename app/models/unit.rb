class Unit < ApplicationRecord
  belongs_to :material

  enum unit: Settings.units.to_h
end

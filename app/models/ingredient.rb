class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true
  validates :amount, presence: true

  enum unit: {g:0, mg:1, kg:2, 個:3, 大さじ:4, 小さじ:5, カップ:6, cc:7, ml:8, 合:9, 升:10}
end

class Recipe < ApplicationRecord

  has_one_attached :image

  validates :cuisine_name, presence: true
  validates :quantity, presence: true
  validates :cook_process, presence: true

  belongs_to :user
  has_many :foodstuffs, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :steps, dependent: :destroy
  

end

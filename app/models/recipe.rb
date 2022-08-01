class Recipe < ApplicationRecord

  has_one_attached :image
  has_one_attached :movie

  validates :cuisine_name, presence: true
  validates :quantity, presence: true


  belongs_to :user
  has_many :bookmarks, dependent: :destroy
# ネストしたフォームへ
  has_many :foodstuffs, dependent: :destroy
  accepts_nested_attributes_for :foodstuffs, allow_destroy: true, reject_if: :all_blank
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank
# タグ付け中間テーブル
  has_many :recipe_genres, dependent: :destroy
  has_many :genres, through: :recipe_genres, dependent: :destroy
  accepts_nested_attributes_for :recipe_genres
  has_many :nutritions, through: :foodstuffs, dependent: :destroy



  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

# 栄養素の計算式
  def calculate(column)
    (nutritions.pluck(column).sum / 100) * (foodstuffs.pluck(:amount).sum)
  end





end

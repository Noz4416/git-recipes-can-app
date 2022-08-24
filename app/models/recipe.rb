class Recipe < ApplicationRecord

  has_one_attached :image
  has_one_attached :movie
  # ネストしたフォームにバリデーションをかける
  validates_associated :ingredients
  validates_associated :steps

  validates :cuisine_name, presence: true
  validates :quantity, presence: true
  validates :ingredients, presence: true
  validates :steps, presence: true

  belongs_to :user
  belongs_to :genre

  has_many :bookmarks, dependent: :destroy

# ネストしたフォームへ
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  has_many :materials
  accepts_nested_attributes_for :materials, allow_destroy: true, reject_if: :all_blank
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank


  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

# 栄養素の計算式
  def calculate(column)
    # "#{column}:#{ingredients[1].material["#{column}"]}:#{ingredients.pluck(:amount).map(&:to_i).sum}"
    materials_sum = 0
    ingredients.each do |ing|
      materials_sum += ing.material["#{column}"]
    end
      materials_amount = ingredients.pluck(:amount).map(&:to_i).sum
      (materials_sum / 100) * materials_amount
    # (materials.pluck(column).sum / 100) * (ingredients.pluck(:amount).sum)
  end

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end





end

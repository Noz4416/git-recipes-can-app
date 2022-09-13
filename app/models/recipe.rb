class Recipe < ApplicationRecord

  has_one_attached :image
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
  has_many :bookmark_recipes, through: :bookmarks, source: :user

# ネストしたフォームへ
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  has_many :materials
  accepts_nested_attributes_for :materials, allow_destroy: true, reject_if: :all_blank
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank


  # def bookmarked_by?(user)
  #   bookmarks.where(user_id: user).exists?
  # end

# 栄養素の計算式
  def calculate(column, recipe)
    # p "==========================================="
    # p "start"
    return_value = 0
    recipe.ingredients.each do |ing|
      next unless ing.material_id
      materials_sum = ing.material["#{column}"]
      # p "column: #{column}"
      # p "name: #{ing.material.name}"
      # p "materials_sum: #{materials_sum}"
      # 単位による条件分岐
      materials_amount = 0
      convert_amount = 0
      if ing.unit == ('g'||'cc'||'ml')
        materials_amount = ing.amount.to_f
      elsif ing.unit == 'kg'
        materials_amount = (ing.amount.to_f) * 1000
      elsif ing.unit == 'mg'
        materials_amount = (ing.amount.to_f) * 0.001
      else
        unit = Unit.find_by(material_id: ing.material_id, unit: ing.unit)
        if unit
          convert_amount = (unit.g * ing.amount.to_f)
          # p "convert_amount: #{convert_amount}"
        else
        end
      end

      # p "total materials_sum: #{materials_sum}"
      # p "total convert_amount: #{convert_amount}"
      ret = ((materials_sum / 100) * (convert_amount + materials_amount))
      # p "ret: #{ret}"
      return_value += ret
    end
    # p "return_value: #{return_value}"
    # p "==========================================="
    return_value.floor(1)
  end


  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_img.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
   # byebug
    image.variant(resize_to_limit: [width, height]).processed
  end


end

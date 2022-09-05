class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_recipes, through: :bookmarks, source: :recipe

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲスト"
    end
  end

# 引数に渡されたものが、userのものであるか？
  def own?(object)
    id == object.user_id
  end

# # 引数に渡されたrecipeがブックマークされているか？
  def bookmark?(recipe)
    bookmark_recipes.include?(recipe)
  end

# # recipe_idを入れてブックマークする
#   def bookmark(recipe)
# # current_userがブックマークしているrecipeの配列にrecipeを入れる
#     bookmark_recipes << recipe
#   end

#   # 引数のrecipeのidをもつ、レコードを削除する
#   def unbookmark(recipe)
#     bookmark_recipes.destroy(recipe)
#   end

  # 公開ステータス
  def public_status
    if  status == false
      "非公開"
    else
      "公開"
    end
  end

  # def active_for_authentication?
  #   super && (is_active == true)
  # end

end
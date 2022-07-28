class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
# ユーザーは同じ投稿に対して1回しかブックマークできない
  validates :user_id, uniqueness: {scope: :recipe_id}
end

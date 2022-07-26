class RecipeGenre < ApplicationRecord
# タグ付け中間テーブル
  belongs_to :recipe
  belongs_to :genre
end

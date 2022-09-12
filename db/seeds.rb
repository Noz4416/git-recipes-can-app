# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

# csvをinportする記述。foreachは大容量のcsvに使う
require 'csv'


# CSV.foreach('db/materials.csv', headers: true) do |row|
#   Material.create(
#     name: row[0],
#     calorie: row[1],
#     protein: row[2],
#     lipid: row[3],
#     carbohydrate: row[4],
#     salt: row[5]
#   )
# end


# Genre.create([
#   { name: '和食'},
#   { name: '洋食'},
#   { name: '中華'},
#   { name: '時短'},
#   { name: 'その他'}
#   ])

# Material Table
CSV.foreach('db/materials.csv', headers: true) do |row|
  name = row[0].gsub(/　/," ").strip # 全角スペースを取り除く
  material_data = Material.find_by(name: name) # 登録済みの原材料か検索する
  # 登録されていない原材料の場合データを登録する
  if material_data.nil?
    puts "#{name}を登録中"
    Material.create(
      name: name,
      calorie: row[1],
      protein: row[2],
      lipid: row[3],
      carbohydrate: row[4],
      salt: row[5]
    )
  end
end

# Unit Table
CSV.foreach('db/units.csv', headers: true) do |row|
  material_data = Material.find_by(name: row[0])

  Unit.find_or_create_by(material_id: material_data.id, g: row[1], unit: 3) unless row[1].blank? # 個 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[2], unit: 4) unless row[2].blank? # 大さじ (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[3], unit: 5) unless row[3].blank? # 小さじ (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[4], unit: 6) unless row[4].blank? # カップ (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[5], unit: 9) unless row[5].blank? # 合 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[6], unit: 10) unless row[6].blank? # 升 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[7], unit: 11) unless row[7].blank? #切れ (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[8], unit: 12) unless row[8].blank? #片 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[9], unit: 13) unless row[9].blank? #丁 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[10], unit: 14) unless row[10].blank? #本 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[11], unit: 15) unless row[11].blank? #束 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[12], unit: 16) unless row[12].blank? #枚 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[13], unit: 17) unless row[13].blank? #尾 (CSVのセルが空でなければ登録する)
  Unit.find_or_create_by(material_id: material_data.id, g: row[14], unit: 18) unless row[14].blank? #杯 (CSVのセルが空でなければ登録する)
end

# Genre Table
# ジャンル一覧の配列
genres = ['和食', '洋食', '中華', '時短', 'その他', 'お気に入り']
# 配列を1つずつ取得し、登録されていなければ登録する
genres.each do |genre|
  Genre.find_or_create_by(name: genre)
end
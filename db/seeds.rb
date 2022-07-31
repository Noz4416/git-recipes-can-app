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

CSV.foreach('db/nutrition.csv', headers: true) do |row|
  Nutrition.create(
    name: row[0],
    calorie: row[1],
    protein: row[2],
    lipid: row[3],
    carbohydrate: row[4],
    salt: row[5]
  )
end


Genre.create([
  { name: '和食'},
  { name: '洋食'},
  { name: '中華'},
  { name: '時短'},
  { name: 'その他'}
  ])

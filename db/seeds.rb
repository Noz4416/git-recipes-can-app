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


CSV.foreach('db/materials.csv', headers: true) do |row|
  Material.create(
    name: row['name'],
    calorie: row['calorie'],
    protein: row['protein'],
    lipid: row['lipid'],
    carbohydrate: row['carbohydrate'],
    salt: row['salt']
  )
end

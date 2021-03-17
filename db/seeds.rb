# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |no|
  Wish.create( title: "テスト#{no}猫と暮らしたい",deadline: "2022-12-31",memo: "テスト#{no}。種類はこだわらない。できれば保護猫を引き取りたい。",completed: false)
end
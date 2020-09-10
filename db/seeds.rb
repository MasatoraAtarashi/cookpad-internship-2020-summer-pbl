Food.destroy_all

foods = []
10.times do |i|
  foods << Food.create!(name: "食材#{i}", picture: 'https://www.nichireifoods.co.jp/media/wp-content/uploads/2020/04/2005_02sasami_01.jpg', protein: rand, fat: rand, carbohydrate: rand)
end

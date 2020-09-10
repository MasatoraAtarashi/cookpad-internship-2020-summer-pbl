Food.destroy_all

foods = []
10.times do |i|
  foods << Food.create!(name: "食材#{i}", picture: "", protein: rand, fat: rand, carbohydrate: rand)
end
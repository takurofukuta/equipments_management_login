require "csv"
require "faker"

User.destroy_all
Equipment.destroy_all
user = User.create!(user_name: "takurofukuta", last_name: "福田", first_name: "拓郎", assignment_year: 2016, password: "password")
1000.times do |i|
Equipment.create!(genre: Faker::Device.manufacturer, lab_equipment_name: Faker::Device.serial, maker_name: Faker::Device.manufacturer, product_name: Faker::Device.model_name, purchase_year: rand(1990..2020), asset_num: Faker::Device.serial,
price: rand(1000..500000), remarks: "test", user_id: user.id )
end
puts "初期データの作成完了"
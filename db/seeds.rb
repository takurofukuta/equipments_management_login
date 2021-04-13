Equipment.destroy_all
user = User.first
20.times do |i|
Equipment.create!(genre: "test", lab_equipment_name: "test#{i}", maker_name: "test", product_name: "test", purchase_year: 1111, asset_num: "test",
price: 1111, remarks: "test", user_id: user.id )
end
puts "初期データの作成完了"
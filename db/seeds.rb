user = User.first
Equipment.destroy_all
2.times do 
Equipment.create!(genre: "test", lab_equipment_name: "test", maker_name: "test", product_name: "test", purchase_year: 1111, asset_num: "test",
price: 1111, disposal_status: 0, remarks: "test", user_id: user.id )
end
puts "初期データの作成完了"
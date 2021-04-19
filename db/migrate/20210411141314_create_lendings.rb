class CreateLendings < ActiveRecord::Migration[6.1]
  def change
    create_table :lendings do |t|
      t.integer :lendings_status, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end

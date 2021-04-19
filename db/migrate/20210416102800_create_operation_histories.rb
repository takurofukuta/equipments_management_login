class CreateOperationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_histories do |t|
      t.integer :content, null: false
      t.references :user, null: false, foreign_key: true
      t.string :lab_equipment_name, null: false

      t.timestamps
    end
  end
end

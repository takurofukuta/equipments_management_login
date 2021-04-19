class CreateOperationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_histories do |t|
      t.integer :content
      t.references :user, null: false, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end

class OperationHistory < ApplicationRecord
  belongs_to :user

  class << self
    def create_log(user_id, lab_equipment_name, content)
      OperationHistory.create!(user_id: user_id, lab_equipment_name: lab_equipment_name, content: content)
    end
  end

  enum content: {
    add_data: 0,
    edit_data: 1,
    delete_data: 2,
  }
end

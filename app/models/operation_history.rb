class OperationHistory < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  class << self
    def create_log(user_id, equipment_id, content)
      OperationHistory.create!(user_id: user_id, equipment_id: equipment_id, content: content)
    end
  end

  enum content: {
    add_data: 0,
    edit_data: 1,
    delete_data: 2,
  }
end

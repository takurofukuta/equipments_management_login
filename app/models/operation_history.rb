class OperationHistory < ApplicationRecord
  belongs_to :user

  class << self
    def create_log(user_id, content)
      OperationHistory.create!(user_id: user_id, content: content)
    end
  end
end

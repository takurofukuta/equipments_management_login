class Lending < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
end

class Equipment < ApplicationRecord
  has_one :lending, dependent: :destroy
  belongs_to :user, optional: true
  validates :genre, presence: true
  validates :lab_equipment_name, presence: true
  validates :maker_name, presence: true
  validates :product_name, presence: true
  validates :purchase_year, presence: true
end

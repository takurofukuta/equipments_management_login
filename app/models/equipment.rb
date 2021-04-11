class Equipment < ApplicationRecord
  belongs_to :user, optional: true
end

class CheckIn < ApplicationRecord
  validates :role_happiness, inclusion: { in: 1..5, message: "%{value} must be between 1 and 5." }
  validates :company_happiness, inclusion: { in: 1..5, message: "%{value} must be between 1 and 5." }
  validates :emotion, presence: true
end
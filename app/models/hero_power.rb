class HeroPower < ApplicationRecord
  belongs_to :hero
  belongs_to :power

  validates :strength, inclusion: { in: %w[Strong Weak Average], message: "%{value} is not a valid strength" }
end

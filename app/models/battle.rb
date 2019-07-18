class Battle < ApplicationRecord
  validates :room, presence: true, length: { is: 5 }, numericality: :only_integer
end

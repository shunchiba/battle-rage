class Battle < ApplicationRecord
  validates :room, presence: true, length: { is: 5 }
end

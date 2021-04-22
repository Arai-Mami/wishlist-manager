class Wish < ApplicationRecord
  has_many :small_steps
  belongs_to :user
end

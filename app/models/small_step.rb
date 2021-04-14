class SmallStep < ApplicationRecord
  belongs_to :wish, dependent: :destroy
end

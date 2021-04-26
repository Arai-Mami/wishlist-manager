class SmallStep < ApplicationRecord
  belongs_to :wish, dependent: :destroy

  def switch_done
    if self.done == false
      self.done = true
      self.save
    else
      self.done = false
      self.save
    end
  end
end

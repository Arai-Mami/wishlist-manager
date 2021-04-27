class DonesController < ApplicationController
  def index
    @wishes = Wish.where(user_id: current_user.id, completed: true)
  end
end

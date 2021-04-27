class DonesController < ApplicationController
  def index
    @wishes = Wish.where(user_id: current_user.id, completed: true)
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def destroy
    wish = Wish.find(params[:id])
    wish.destroy
    redirect_to :action => "index"
  end
end

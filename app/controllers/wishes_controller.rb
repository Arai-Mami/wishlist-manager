class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
    Wish.create(wish_params)
  end

  def show
  end

  private
  def wish_params
    re_params = params.require(:wish).permit(:title, :memo)
    date = params.require(:wish).permit(:deadline)
    deadline = Date.new(date["deadline(1i)"].to_i, date["deadline(2i)"].to_i,  date["deadline(3i)"].to_i)
    re_params.merge(deadline: deadline)
  end
end

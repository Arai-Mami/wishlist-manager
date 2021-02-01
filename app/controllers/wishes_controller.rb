class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
  end

  def show
  end
end

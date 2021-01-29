class WishesController < ApplicationController
  def index
    @wishes= Wish.all
  end

  def new
  end

  def show
  end
end

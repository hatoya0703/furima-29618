class ItemsController < ApplicationController

  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
  
  private
  def item_params
    params.require(:item).perimit(image)
  end
end

class ItemsController < ApplicationController
  def index
<<<<<<< Updated upstream
=======
    @items = Item.order("created_at DESC")
>>>>>>> Stashed changes
  end
end

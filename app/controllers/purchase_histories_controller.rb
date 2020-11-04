class PurchaseHistoriesController < ApplicationController
  def index
  end

  def create
    @purchase_history = PurchaseHistory.create(purchase_history_params)
  end

end

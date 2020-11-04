class PurchaseHistoriesController < ApplicationController
  def index
  end

  def create
    PurchaseHistory.create(purchase_history_params)
  end

end

class PurchaseItemsController < ApplicationController
  def show
    @purchase = Purchase.find(params[:id])
    @perpage =20
    @purchase_item = PurchaseItem.where(purchase_id: params[:id])
    @purchase_items = @purchase_item.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end
end
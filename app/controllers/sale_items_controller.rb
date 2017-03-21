class SaleItemsController < ApplicationController
  def show
  @sale = Sale.find(params[:id])
  @perpage =20
  @sale_item = SaleItem.where(sale_id: params[:id])
  @sale_items = @sale_item.paginate(:page => params[:page], :per_page => @perpage)
  @page = params[:page] || 1
    end
end

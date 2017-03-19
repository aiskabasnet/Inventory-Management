class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @purchase_item = @purchase.purchase_items.build
    @item = Item.order(:name)
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.purchase_items.each_with_index do |g,i|
      @stocks = Stock.where(item_id: g.item_id)
      @stocks.each do |f|
        @stock = f
      end
      @stock.unit_price = ((@stock.unit_price * @stock.quantity) + (g.unit_price * g.quantity)) / (@stock.quantity + g.quantity)
      @stock.quantity = @stock.quantity + g.quantity
      @stock.save
    end
    if @purchase.save
      flash[:success] = "Items added."
    else
      flash[:error] = "Items not added."
    end
    redirect_to :new_purchase
  end

  def index
    @purchase = Purchase.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  def item_select
    @item = Item.select('name,id');
    render json: @item
  end

  private

  def purchase_params
    params.require(:purchase).permit(:vendor_id, purchase_items_attributes: [ :purchase_id , :item_id, :quantity, :unit_price ])
  end
end
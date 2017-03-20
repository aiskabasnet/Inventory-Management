class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @purchase_item = @purchase.purchase_items.build
    @item = Item.order(:name)
    @date = Purchase.limit(1).reverse
  end
  def create
    @purchase = Purchase.new(purchase_params)
    @company_profile = CompanyProfile.first
    @purchase.fiscal_year = @company_profile.fiscal_year
    @totalcost = 0
    @purchase.purchase_items.each do |total|
      if total.present?
        @totalcost += total.unit_price * total.quantity
      end
    end
    @purchase.total = @totalcost
=begin
    @fiscal_year = FiscalYear.all
    @fiscal_year.each do |f|
      @fiscal = f.name
    end
    @purchase.fiscal_year = @fiscal
=end
    if @purchase.save
      @log = Log.create(description: "Purchase items from" + @purchase.supplier.name, user: current_user )
      @purchase.purchase_items.each do |g|
        if g.present?
          @stocks = Stock.where(item_id: g.item_id)
          @stocks.each do |f|
            @stock = f
          end
          @stock.unit_price = ((@stock.unit_price * @stock.quantity) + (g.unit_price * g.quantity)) / (@stock.quantity + g.quantity)
          @stock.quantity = @stock.quantity + g.quantity
          @stock.save
        end
      end
      flash[:success] = "Items purchased successfully"

      redirect_to '/purchases/new'
    else
      @item = Item.order(:name)
      render 'new'
    end
  end

  def index
    @title = "List"
    @perpage = 20
    @purchase = Purchase.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
    @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page => 10)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:supplier_id, :date, :bill_number, :discount, purchase_items_attributes: [:purchase_id , :item_id, :quantity, :unit_price, :_destroy ])
  end
end
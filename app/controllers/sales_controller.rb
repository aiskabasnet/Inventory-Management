class SalesController < ApplicationController
    def new
      @sale = Sale.new
      @sale_item = @sale.sale_items.build
      @item = Item.order(:name)
      @company_profile = CompanyProfile.find(8);
      @date = Sale.limit(1).reverse
    end
    def create
      @sale = Sale.new(sale_params)
      @company_profile = CompanyProfile.first
      @sale.fiscal_year = @company_profile.fiscal_year
      @totalcost = 0
      @sale.sale_items.each do |total|
        if total.present?
          @totalcost += total.unit_price * total.quantity
        end
      end
      @sale.total = @totalcost
=begin
    @fiscal_year = FiscalYear.all
    @fiscal_year.each do |f|
      @fiscal = f.name
    end
    @sale.fiscal_year = @fiscal
=end
      if @sale.save
        @log = Log.create(description: "Sold items to" + @sale.customer.name, user: current_user )
        @sale.sale_items.each do |g|
          if g.present?
            @stocks = Stock.where(item_id: g.item_id)
            @stocks.each do |f|
              @stock = f
            end
=begin
            @stock.unit_price = ((@stock.unit_price * @stock.quantity) + (g.unit_price * g.quantity)) / (@stock.quantity + g.quantity)
=end
            @stock.quantity = @stock.quantity - g.quantity
            @stock.save
          end
        end
        flash[:success] = "Items Saled successfully"

        redirect_to '/sales/new'
      else
        @item = Item.order(:name)
        render 'new'
      end
    end

    def show
      @sale_item = SaleItem.find(params[:id])
    end

    def index
      @title = "List"
      @perpage = 20
      @sale = Sale.paginate(:page => params[:page], :per_page => @perpage)
      @page = params[:page] || 1
      @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page => 10)
    end

    private

    def sale_params
      params.require(:sale).permit(:customer_id, :date, :bill_number, :discount, sale_items_attributes: [:sale_id , :item_id, :quantity, :unit_price, :_destroy ])
    end
end

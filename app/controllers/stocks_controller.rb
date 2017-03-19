class StocksController < ApplicationController
    def edit
      @stock = Stock.find(params[:id])
    end

    def show
      @stock = Stock.find(params[:id])
    end

    def index
      @page = params[:page] || 1
      @stock = Stock.paginate(:page => params[:page], :per_page =>5)
    end

    def update
      @stock = Stock.find(params[:id])
      if @stock.update(stock_param)
        flash[:success]= "Stock edited successfully !!"
        redirect_to '/stocks'
      else
        render 'edit'
      end

    end

    def destroy
      @stock = Stock.destroy([params[:id]])
      redirect_to @stock
      flash[:success] = "Record Deleted Successfully !!"
    end

    def new
      @stock = Stock.new
    end

    def create
      @stock= Stock.new(stock_param)
      if @stock.save
        flash[:success] = "Stock added successfully"
        redirect_to '/stocks'
      else
        render 'new'
      end
    end

    private
    def stock_param
      params.require(:stock).permit(:item_id, :quantity, :unit_price, :est_sell_price)
    end

end

class SalesController < ApplicationController
  def edit
    @sale = Sale.find(params[:id])
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @sale = Sale.paginate(:page => params[:page], :per_page =>5)
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sale_param)
      @log = Log.create(description: "Edited Sale "+ @sale.name, user: current_user )
      flash[:success]= "Sale edited successfully !!"
      redirect_to '/sales'
    else
      render 'new'
    end


  end

  def destroy
    @sale = Sale.find(params[:id])
    @log = Log.create(description: "Deleted Sale "+ @sale.name, user: current_user )
    @sale.destroy
    flash[:success] = "Record Deleted !!"
    redirect_to "/sales"

  end

  def new
    @sale = Sale.new
  end

  def create
    @sale= Sale.new(sale_param)
    @company_profile = CompanyProfile.first
    @sale.fiscal_year = @company_profile.fiscal_year
    if @sale.save
      flash[:success] = "Sale added successfully"

      redirect_to '/sales/new'
    else
      render 'new'
    end
  end
  private
  def sale_param
    params.require(:sale).permit(:item_id, :unit_sell_price, :fiscal_year, :quantity, :cash_credit, :customer_id)
  end
end

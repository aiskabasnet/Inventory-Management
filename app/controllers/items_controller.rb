class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def index

  #  @items = Item.order(:name).where("name like ?", "%#{params[:term]}%")
  #  render json: @items.map(&:name)
    @page = params[:page] || 1
    @item = Item.paginate(:page => params[:page], :per_page =>10)
    @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page => 10)
  end

  def update
    @item = Item.find(params[:id])
   if @item.update(item_param)
     @log = Log.create(description: "Edited a item "+ @item.name, user: current_user )
     flash[:success]= "Item edited successfully !!"
    redirect_to '/items'
   else
     render 'edit'
     end

  end


  def new
    @item = Item.new
    @item.build_stock
  end

  def create
    @item= Item.new(item_param)
    @company_profile = CompanyProfile.first
    @item.fiscal_year = @company_profile.fiscal_year
    if @item.save
      @log = Log.create(description: "Added new item "+ @item.name, user: current_user )
      flash[:success] = "Item added successfully !!"
      redirect_to '/items/new'
    else
      render 'new'
    end
  end

  def destroy

    @item = Item.find(params[:id])
    @log = Log.create(description: "Deleted an item "+ @item.name, user: current_user )
    @item.destroy
    flash[:success] = "Record Deleted !!"
    redirect_to "/items"

  end

  private
  def item_param
    params.require(:item).permit(:name, :unit_id, :item_code, :item_group_id, :description,:current_fiscal_year_id, stock_attributes: [:item_id,
    :quantity, :unit_price, :est_sell_price, :_destroy])
  end

end

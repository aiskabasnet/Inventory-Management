class SuppliersController < ApplicationController
  def edit
    @supplier = Supplier.find(params[:id])
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @supplier = Supplier.paginate(:page => params[:page], :per_page =>5)
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_param)
      @log = Log.create(description: "Edited Supplier "+ @supplier.name, user: current_user )
      flash[:success]= "Supplier edited successfully !!"
      redirect_to '/suppliers'
    else
      render 'edit'
    end


  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @log = Log.create(description: "Deleted Supplier "+ @supplier.name, user: current_user )
    @supplier.destroy
    flash[:success] = "Record Deleted !!"
    redirect_to "/suppliers"
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier= Supplier.new(supplier_param)
    if @supplier.save
      @log = Log.create(description: "Added new Supplier "+ @supplier.name, user: current_user )
      flash[:success] = "Supplier added successfully"

      redirect_to '/suppliers/new'
    else
      render 'new'
    end
  end

  private
  def supplier_param
    params.require(:supplier).permit(:name, :address,:phone_number,:email)
  end

end

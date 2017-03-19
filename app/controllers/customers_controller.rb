class CustomersController < ApplicationController
    def edit
      @customer = Customer.find(params[:id])
    end

    def show
      @customer = Customer.find(params[:id])
    end

    def index
      @page = params[:page] || 1
      @customer = Customer.paginate(:page => params[:page], :per_page =>5)
    end

    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_param)
        @log = Log.create(description: "Edited Customer "+ @customer.name, user: current_user )
        flash[:success]= "Customer edited successfully !!"
        redirect_to '/customers'
      else
        render 'edit'
      end


    end

    def destroy
      @customer = Customer.find(params[:id])
      @log = Log.create(description: "Deleted Customer "+ @customer.name, user: current_user )
      @customer.destroy
      flash[:success] = "Record Deleted !!"
      redirect_to "/customers"

    end

    def new
      @customer = Customer.new
    end

    def create
      @customer= Customer.new(customer_param)
      if @customer.save
        @log = Log.create(description: "Added new Customer "+ @customer.name, user: current_user )
        flash[:success] = "Customer added successfully"

        redirect_to '/customers/new'
      else
        render 'new'
      end
    end

    private
    def customer_param
      params.require(:customer).permit(:name, :address,:phone_number,:email)
    end
end

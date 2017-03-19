class UnitsController < ApplicationController
    def edit
      @unit = Unit.find(params[:id])
    end

    def show
      @unit = Unit.find(params[:id])
    end

    def index
      @page = params[:page] || 1
      @unit = Unit.paginate(:page => params[:page], :per_page =>10)
    end

    def update
      @unit = Unit.find(params[:id])
     if @unit.update(unit_param)
       @log = Log.create(description: "Edited unit "+ @unit.name, user: current_user )
       flash[:success]= "Unit: #{@unit.name} edited successfully !!"

      redirect_to '/units'
     else
     render 'edit'
     end


    end

    def destroy
      @unit = Unit.find(params[:id])
      @log = Log.create(description: "Deleted unit "+ @unit.name, user: current_user )
      @unit.destroy
      flash[:success] = "Record Deleted !!"
      redirect_to "/units"

    end

    def new
      @unit = Unit.new
    end

    def create
      @unit= Unit.new(unit_param)
      if @unit.save
        @log = Log.create(description: "Added new unit "+ @unit.name, user: current_user )
        flash[:success] = "New unit: #{@unit.name} added successfully"

        redirect_to '/units/new'
      else
        render 'new'
      end
    end

    private
    def unit_param
      params.require(:unit).permit(:name, :print_name)
    end

end

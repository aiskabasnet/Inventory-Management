class FiscalYearsController < ApplicationController
    def edit
      @fiscal_year = FiscalYear.find(params[:id])
    end

    def show
      @fiscal_year = FiscalYear.find(params[:id])
    end

    def index
      @page = params[:page] || 1
      @company_profile = CompanyProfile.first
      @fiscal_years = FiscalYear.paginate(:page => params[:page], :per_page =>5)
    end

    def update
      @fiscal_year = FiscalYear.find(params[:id])
      if @fiscal_year.update(fiscal_year_param)
        @log = Log.create(description: "Edited fiscal year "+ @fiscal_year.name, user: current_user )
        flash[:success] = "Fiscal years edited successfuly !!"
      redirect_to "/fiscal_years"
      else
        render 'edit'
        end

    end

    def destroy
      @fiscal_year = FiscalYear.find(params[:id])
      @log = Log.create(description: "Deleted fiscal year "+ @fiscal_year.name, user: current_user )
      @fiscal_year.destroy
      flash[:success] = "Record deleted !!"
      redirect_to "/fiscal_years"

    end

    def new
      @fiscal_year = FiscalYear.new
    end

    def create
      @fiscal_year= FiscalYear.new(fiscal_year_param)
      if @fiscal_year.save
        @log = Log.create(description: "Added new fiscal year "+ @fiscal_year.name, user: current_user )
        flash[:success] = "Fiscal year added successfully !!"
        redirect_to "/fiscal_years"
      else
        render 'new'
      end
    end

    private
    def fiscal_year_param
      params.require(:fiscal_year).permit(:name, :start_date, :end_date)
    end
end

class CompanyProfilesController < ApplicationController
    def edit
      @company_profile = CompanyProfile.find(params[:id])
    end

    def show
      @company_profile = CompanyProfile.find(params[:id])
    end

    def index
      @page = params[:page] || 1
      @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page =>5)
    end

    def update
      @company_profile = CompanyProfile.find(params[:id])
     if @company_profile.update(company_profile_param)
       @log = Log.create(description: "Edited company profile ", user: current_user )
       flash[:success]= "Company Profile edited successfully !!"
      redirect_to "/company_profiles/8/edit"
     else
       render 'edit'
       end

    end

    def destroy
      @company_profile = CompanyProfile.destroy([params[:id]])
      redirect_to @company_profile
      flash[:success] = "Record Deleted"
    end

    def new
      if CompanyProfile.count == 0
      @company_profile = CompanyProfile.new
      else
        redirect_to "/company_profiles", :notice => "You can have only one company profiles !! "
        end
    end

    def create
      @company_profile= CompanyProfile.new(company_profile_param)
      if @company_profile.save
        flash[:success] = "Company Profile added successfully !!"
        redirect_to "/company_profiles"
      else
        render 'new'
      end
    end


    private
    def company_profile_param
      params.require(:company_profile).permit(:name,:address,:vdc_mun,:ward_no,:vat,:phone_number, :vat_pan_no, :logo,
      :district,:zone, :fiscal_year_id)
    end
    
end

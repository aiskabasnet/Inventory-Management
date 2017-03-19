class HomesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Users", :homes_path
    def index
      @page = params[:page] || 1
      @user = User.paginate(:page => params[:page], :per_page =>5)
    end
    def show
      @user = User.find_by_id(params[:id])
    end
  def new
    @user = User.new
  end
  def create
    @user= User.new(user_param)
    if @user.save
      @log = Log.create(description: "Created a user "+ @user.username, user: current_user )
      redirect_to '/homes/index', notice: "User Successfully Created"
    else
      render 'new'
    end

  end
    def destroy
      @user = User.find(params[:id])


      if @user.destroy
        @log = Log.create(description: "Deleted a user "+ @user.username, user: current_user )
        flash[:success] = "User Deleted Successfully !!"
        redirect_to '/homes'
      end
    end
    def edit
      @user = User.find(params[:id])
    end


    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to '/homes/index'
      else
        render 'edit'
      end
    end
  def manage_homes
    @title = "Manage homes"
    @user = User.all
    add_breadcrumb "Manage homes", :homes_path
  end
  private
  def user_param
    params.require(:user).permit(:user_id , :email, :password,:password_confirmation, :first_name, :middle_name,:last_name, :username)
  end
end

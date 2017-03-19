class UsersController < ApplicationController

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
        redirect_to user_url, notice: "User Successfully Created"
      else
        render 'new'
      end

    end

    private
    def user_param
      params.require(:user).permit(:email, :password,:password_confirmation)
    end
end

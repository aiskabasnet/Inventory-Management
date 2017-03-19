class ItemGroupsController < ApplicationController
    def edit
      @item_group = ItemGroup.find(params[:id])
    end

    def show
      @item_group = ItemGroup.find(params[:id])
    end

    def index
      @page = params[:page] || 1
      @item_group = ItemGroup.paginate(:page => params[:page], :per_page =>10)
    end

    def update
      @item_group = ItemGroup.find(params[:id])
     if @item_group.update(item_group_param)
       @log = Log.create(description: "Edited item group "+ @item_group.name, user: current_user )
       flash[:success] = "Item group edited successfully !"
      redirect_to "/item_groups"
     else
       render 'edit'
       end

    end

    def destroy

      @item_group = ItemGroup.find(params[:id])
      @log = Log.create(description: "Deleted item group"+ @item_group.name, user: current_user )
      @item_group.destroy
      flash[:success] = "Item group deleted successfully !!"
      redirect_to "/item_groups"
    end

    def new
      @item_group = ItemGroup.new
    end

    def create
      @item_group= ItemGroup.new(item_group_param)
      if @item_group.save
        @log = Log.create(description: "Added new item group "+ @item_group.name, user: current_user )
        flash[:success] = "Item group added successfully !!"
        redirect_to "/item_groups"
      else
        render 'new'
      end
    end

    private
    def item_group_param
      params.require(:item_group).permit(:name, :parent_id, :description)
    end
    
end

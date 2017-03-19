class LogsController < ApplicationController
def new

end
  def create

  end
  def index
    @page = params[:page] || 1
    @log = Log.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
end

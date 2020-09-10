class PboxesController < InheritedResources::Base
       
    #Smart_listing
    include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
    before_action :set_pbox, only:[:delete, :edit, :show]

def index
     @q = Pbox.ransack(params[:q])
     @pboxes = @q.result(distinct: true).order(:name).page(params[:page]).per(20)
     @pboxes = smart_listing_create(:pboxes, @pboxes, partial: "pboxes/smart_listing/list", default_sort: {name: "desc"}, page_sizes: [20, 30, 50, 100])  
end

# GET /pboxes/new
def new
  @pbox = Pbox.new
end

def create
  @pbox = Pbox.create(pbox_params)
  if @pbox.valid?
    flash.keep[:success] = "Task completed!"
    redirect_to clone_batches_path
  else
    render "pboxes/new"
  end
end

# GET /pboxes/new
def edit
  
end

def update
     @pbox.update_attributes(assay_params)
     if @pbox.valid?
      flash.keep[:success] = "Task completed!"
      redirect_to clone_batches_path
    else
      render :action => 'edit'
    end
end

  private
    def pbox_params
      params.require(:pbox).permit(:name, :barcode)
    end
    
    def set_pbox
      @pbox = Box.find(params[:id])
    end
end


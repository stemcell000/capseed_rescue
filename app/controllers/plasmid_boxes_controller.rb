class PlasmidBoxesController < InheritedResources::Base
       
    #Smart_listing
    include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
    
    before_action :set_plasmid_box, only:[:delete, :edit, :show]

def index
     @q = PlasmidBox.ransack(params[:q])
     @plasmid_boxes = @q.result(distinct: true).order(:name)
     @plasmid_boxes = smart_listing_create(:plasmid_boxes, @plasmid_boxes, partial: "plasmid_boxes/smart_listing/list", default_sort: {name: "desc"}, page_sizes: [20, 30, 50, 100])  
end

def new
  @plasmid_box = PlasmidBox.new
end

def create
  @plasmid_box = PlasmidBox.create(plasmid_box_params)
  if @plasmid_box.valid?
    flash.keep[:success] = "Task completed!"
    redirect_to plasmid_boxes_path
  else
    render :action => 'new'
  end
end

def edit
  
end

def update
     @plasmid_box.update_attributes(assay_params)
     if @plasmid_box.valid?
      flash.keep[:success] = "Task completed!"
      redirect_to clone_batches_path
    else
      render :action => 'edit'
    end
end

  private
    def plasmid_box_params
      params.require(:plasmid_box).permit(:name, :barcode)
    end
    
    def set_plasmid_box
      @plasmid_box = PlasmidBox.find(params[:id])
    end
end


class BoxesController < InheritedResources::Base
       
    #Smart_listing
    include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
    
    before_action :set_box, only:[:delete, :edit, :show, :update]

  
def index
     @q = Box.ransack(params[:q])
     @boxes = @q.result(distinct: true)
     if params[:q].blank?
      @virus_batches = VirusBatch.all  
     else
      positions = Position.where(box_id: @boxes.pluck(:id)) 
      @virus_batches = VirusBatch.where(position_id: positions.pluck(:id))
     end
      @boxes = @boxes.includes(:positions)
      @virus_batches = smart_listing_create(:virus_batches, @virus_batches, partial: "virus_batches/smart_listing/list", default_sort: {id: "asc"}, page_sizes: [20, 30, 50, 100])
      @boxes = smart_listing_create(:boxes, @boxes, partial: "boxes/smart_listing/list", default_sort: {name: "asc"}, page_sizes: [10, 20, 30, 50, 100])
end

def box_inventory
 @q = Box.ransack(params[:q])
 @boxes = @q.result(distinct: true).order(:name).page(params[:page]).per(20)
 @boxes = smart_listing_create(:boxes, @boxes, partial: "boxes/smart_listing/list", default_sort: {name: "desc"}, page_sizes: [20, 30, 50, 100])  
end

def destroy
 @box.destroy
end

def fetch_virus_batches
  @box = Box.find(params[:id])
  if @box.box_type
    @box_type = @box.box_type
    @v_max = @box_type.vertical_max
    @h_max = @box_type.horizontal_max
    @position_ids = @box.positions.order(:nb).pluck(:id)
    @position_nbs = @box.positions.order(:nb).pluck(:nb)
    @position_names = @box.positions.order(:nb).map{|p|p.name.upcase()}
    @position_batch_names = @box.positions.order(:nb).map{|p| p.virus_batch.nil? ? "":p.virus_batch.name}
  else
    @v_max = 0
    @h_max = 0
    @position_ids = []
    @position_names = []
  end
    @virus_batches = VirusBatch.where(position_id: @position_ids)
    @virus_batches = smart_listing_create(:virus_batches, @virus_batches, partial: "virus_batches/smart_listing/list", default_sort: {name: "asc"}, page_sizes: [20, 30, 50, 100])
end

def fetch_position
  @virus_batch = VirusBatch.find(params[:virus_batch_id])
  @box = Box.find(params[:box_id])
if @box.box_type
    @box_type = @box.box_type
    @v_max = @box_type.vertical_max
    @h_max = @box_type.horizontal_max
    @position_ids = @box.positions.order(:nb).pluck(:id)
    @position_nbs = @box.positions.order(:nb).pluck(:nb)
    @position_names = @box.positions.order(:nb).map{|p|p.name.upcase()}
    @position_batch_names = @box.positions.order(:nb).map{|p| p.virus_batch.nil? ? "":p.virus_batch.name}
  else
    @v_max = 0
    @h_max = 0
    @position_ids = []
    @position_names = []
  end
    @virus_batches = VirusBatch.where(position_id: @position_ids)
    @virus_batches = smart_listing_create(:virus_batches, @virus_batches, partial: "virus_batches/smart_listing/list", default_sort: {id: "asc"}, page_sizes: [20, 30, 50, 100])
end
 
def new
  @box = Box.new
end

def create
   @box = Box.create(box_params)
   if  @box.valid?
     flash.keep[:success] = "Box created !"
     @box.generate_positions
     redirect_to virus_productions_path
   else
     render action: "new"
   end
end

def edit
  
end

def update
    @box.update_attributes(box_params)
     if @box.valid?
       flash.keep[:success] = "Task completed!"
       redirect_to boxes_path 
    else
        render :action => 'edit'
    end
end

def show
  
end
 
private
    def box_params
      params.require(:box).permit(:name, :box_type_id, :barcode, :box_type_id, :shelf_id)
    end
    
    def set_box
      @box = Box.find(params[:id])
    end
end


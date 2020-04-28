class BoxesController < InheritedResources::Base
       
    #Smart_listing
    include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
    
    before_action :set_box, only:[:delete, :edit, :fetch_position, :show]

  
def index

     @q = Box.ransack(params[:q])
      
     @boxes = @q.result(distinct: true)
     
     if params[:q].blank?
      @virus_batches = VirusBatch.all  
     else
      positions = Position.where(box_id: @boxes.pluck(:id)) 
      @virus_batches = VirusBatch.where(position_id: positions.pluck(:id))
     end
      @boxes = @boxes.includes(:positions, :virus_batches).order(:name).page(params[:page]).per(20)
      @virus_batches = @virus_batches.order(:id).page(params[:page]).per(20)
end

def box_inventory
     @q = Box.ransack(params[:q])
     @boxes = @q.result(distinct: true)
     @boxes = @boxes.order(:name).page(params[:page]).per(20)
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
    @position_ids = @box.position_ids
    @position_names = @box.positions.map{|p|p.name.upcase()}
    @position_batch_names = @box.positions.map{|p| p.virus_batch.nil? ? "":p.virus_batch.name}
  else
    @v_max = 0
    @h_max = 0
    @position_ids = []
    @position_names = []
  end
    @virus_batches = VirusBatch.where(position_id: @position_ids).order(:id).page params[:page]
end

def fetch_positions
  @positions =  box.positions
  render "fetch_positions"
end
 
def new
  @box = Box.new
end

 def create
   @box = Box.create(box_params)
   if  @box.valid?
     flash.keep[:success] = "Task completed!"
     @box.generate_positions
   else
     render action: "new"
   end
   
 end

def edit
  
end

def update
  
end

def show
  
end
 
  private

    def box_params
      params.require(:box).permit(:name, :box_type_id, :plasmid_batch [:id, :name, :plasmid_batch_id], plasmid_batch_ids: [])
    end
    
    def set_box
      @box = Box.find(params[:id])
    end
end


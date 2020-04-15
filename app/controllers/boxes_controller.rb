class BoxesController < InheritedResources::Base
def index

     @q = Box.ransack(params[:q])
      
     @boxes = @q.result(distinct: true)
     
     if params[:q].blank?
      @virus_batches = VirusBatch.all  
     else
      positions = Position.where(box_id: @boxes.pluck(:id)) 
      @virus_batches = VirusBatch.where(position_id: positions.pluck(:id))
     end
      @boxes = @boxes.includes(:positions, :virus_batches).order(:name).page params[:page]
      @virus_batches = @virus_batches.order(:id).page params[:page]
end

def fetch_virus_batches
  @box = Box.find(params[:id])     
  positions = Position.where(box_id: @box.id) 
  @virus_batches = VirusBatch.where(position_id: positions.pluck(:id)).order(:id).page params[:page]
end
 
def new
  
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
      params.require(:box).permit(:name, :plasmid_batch [:id, :name, :plasmid_batch_id], plasmid_batch_ids: [])
    end
    
    def load_box
      @box = Box.find(params[:box_id])
    end
end


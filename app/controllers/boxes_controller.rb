class BoxesController < InheritedResources::Base
 def index
  
end
  
def new
  
end

 def create
   @box = Box.new(box_params)
   @box.save
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


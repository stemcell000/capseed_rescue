class PlasmidBoxesController < InheritedResources::Base
       
    
    before_action :set_plasmid_box, only:[:delete, :edit, :show]

def index
     @q = PlasmidBox.ransack(params[:q])
     records = @q.result(distinct: true).order(:name)
     @pagy, @plasmid_boxes = pagy(records.order(name: :desc), items: 30)
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


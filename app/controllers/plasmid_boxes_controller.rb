class PlasmidBoxesController < InheritedResources::Base

def new
  @plasmid_box = PlasmidBox.new
end

def create
  if @plasmid_box.valid?
    flash.keep[:success] = "Task completed!"
  else
    render :action => 'new'
  end
end
  private

    def plasmid_box_params
      params.require(:plasmid_box).permit(:name, :barcode)
    end
end


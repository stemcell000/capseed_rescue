class VirusBatchesController < InheritedResources::Base
  
   before_action :set_objects, only:[:edit_from_inventory, :sort_tube, :update_from_inventory, :update_box]
   before_action :set_collections, only:[:update_box, :update_from_inventory]
   
def index
      #Formattage des dates
      start_time = params[:date_gteq].to_date rescue Date.current
      start_time = start_time.beginning_of_day # sets to 00:00:00
      end_time = params[:date_lteq].to_date rescue Date.current
      end_time = end_time.end_of_day # sets to 23:59:59
      
      @q = VirusBatch.ransack(params[:q])
      @q.sorts = ['name asc', 'date desc'] if @q.sorts.empty?
      vbs = @q.result
      @virus_batches = vbs.includes([:virus_production]).order(:name).page params[:page]
      
      vb_ids = vbs.map{|vb|vb.id}
      
      @boxes = Box.joins(:virus_batches).where(virus_batches: {id: vb_ids})
      @boxes = @boxes.order(:name).page params[:page]
end
 
def new
  
end

def create
  
end

def update
  
end

def show
  
end

 def new_from_inventory
    @virus_batch = VirusBatch.new
    @virus_production = VirusProduction.find(params[:virus_production_id])
    nb = @virus_production.virus_batches.size+1
    @boxes = Box.where.not(:name => "Garbage")
    @name = @virus_production.nb.to_s+"."+nb.to_s
end

def create_from_inventory
    @virus_batch = VirusBatch.create(virus_batch_params)
    @virus_production = VirusProduction.find(params[:virus_production_id])
    if  @virus_batch.valid?
        @virus_production.virus_batches << @virus_batch
        flash.keep[:success] = "Task completed!"
        @virus_batches = @virus_production.virus_batches
    else
        render :action => 'new_from_inventory'
    end
end


def edit_from_inventory

end

def update_from_inventory
  @virus_production  = VirusProduction.find(params[:virus_production_id])
  @virus_batches = @virus_production.virus_batches
  @virus_batch.update_attributes(virus_batch_params)
  
  if @virus_batch.valid?
    @units = Unit.all
    flash.keep[:success] = "Task completed!"
  else
    render :action => 'edit_from_inventory'
   end
end

def sort_tube
  @boxes = Box.find(Position.all.pluck(:box_id)).uniq
 
  @current_box_positions = @virus_batch.position.nil? ? Position.all : @virus_batch.position.box.positions
  
  @positions_container_switch = @virus_batch.position.nil? 
  
  @positions = params[:box_id]? Position.where(box_id: params[:box_id]) : @current_box_positions
  @passed = params[:box_id]? "Oui":"Non"
  puts "from sort_tube -> box_id = "
  puts params[:box_id]
  respond_to do |format|
    format.js
  end
end


def update_box
  @virus_production  = VirusProduction.find(params[:virus_production_id])
  @virus_batches = @virus_production.virus_batches
  @virus_batch.update_attributes(virus_batch_params)
  if @virus_batch.valid?
    flash.keep[:success] = "Task completed : the tube is sorted out !"
  else
    render :action => 'sort_tube'
   end
end 

def destroy_from_inventory
  @virus_batch = VirusBatch.find(params[:id])
  @virus_production  = VirusProduction.find(params[:virus_production_id])
  @virus_batches = @virus_production.virus_batches
    @virus_batch.toggle!(:trash)
    @virus_batch.update_columns(:volume => 0)
    
    unless @virus_batch.trash
      @virus_batch.update_columns(:volume => 0)
      @virus_batch.position.delete
     end
     
      @row = @virus_batch.row
      @column = @virus_batch.column
      
      if @row 
        @row.virus_batches.delete(@virus_batch)
      end
      
      if @column
        @column.virus_batches.delete(@virus_batch)
      end
  end
  
  private
    def virus_batch_params
      params.require(:virus_batch).permit(:id, :name, :barcode, :volume, :virus_production_id, :box_id, :position_id, :trash, :vol_unit_id, :comment, :date, :date_of_thawing,
      virus_production_ids: [],
      :virus_production_attributes =>[:id, :nb])
    end
    
    def set_objects
        @virus_batch = VirusBatch.find(params[:id])
        @virus_production = @virus_batch.virus_production
    end

    def set_collections
      @virus_production  = VirusProduction.find(params[:virus_production_id])
      @virus_batches = @virus_production.virus_batches
    end
end


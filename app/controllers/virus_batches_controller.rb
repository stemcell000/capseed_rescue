class VirusBatchesController < InheritedResources::Base
  
   before_action :set_objects, only:[:edit_from_inventory, :sort_tube, :update_from_inventory]
   before_action :set_collections, only:[ :update_from_inventory, :destroy_from_inventory]
   #before_action :set_unsorted_collection, only:[:sorter, :map_tube, :update_box]
   
    #Smart_listing
    include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
   
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
        @virus_batch.generate_recap(@virus_production)
        @virus_production.virus_batches << @virus_batch
        flash.keep[:success] = "Task completed!"
        @virus_batches = @virus_production.virus_batches
        @arr = @virus_batches.each_slice(4).to_a
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
    @virus_batch.generate_recap(@virus_production)
    flash.keep[:success] = "Task completed!"
  else
    render :action => 'edit_from_inventory'
   end
end


def destroy_from_inventory
    @virus_batch.toggle!(:trash)
    if @virus_batch.trash
      @virus_batch.update_columns(:volume => 0)
      if @virus_batch.position
        @virus_batch.position.delete
       end
    end
    redirect_to add_vb_from_inventory_virus_production_url(@virus_production.id)
 end
  
 def sorter
   set_box_map
 end
 
 def map_tube
    set_box_map
    respond_to do |format|
      format.js
    end
  end
  
  def update_box
  @virus_batch = VirusBatch.find(params[:virus_batch_id])    
    if params[:position_id]
      position = Position.find(params[:position_id])
    else
      @virus_batch.position.delete
    end
    #
    @virus_batch.position = position
    @virus_batch.save!
    set_box_map
    #
    respond_to do |format|
      format.js
    end
  end
  
  def unsort
    @virus_batch = VirusBatch.find(params[:virus_batch_id])
    @virus_batch.position = position
    @virus_batch.save!
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
      @virus_batch = VirusBatch.find(params[:id])
      @virus_production  = @virus_batch.virus_production
      @virus_batches = @virus_production.virus_batches
      @arr = @virus_batches.each_slice(4).to_a
    end
    
    def set_box_map
      @virus_batches = VirusBatch.where(trash: false).where(position_id: nil).order(:id)
      @arr = @virus_batches.each_slice(5).to_a
      if params[:box_id]
        @box = Box.find(params[:box_id])
        @box_type = @box.box_type
        @v_max = @box_type.vertical_max
        @h_max = @box_type.horizontal_max
    
        @position_ids = @box.position_ids
        @position_names = @box.positions.map{|p| p.name.upcase}
        @position_batch_names = @box.positions.map{|p| p.virus_batch.nil? ? "":p.virus_batch.name}
        @position_batch_ids = @box.positions.order(:nb).map{|p| p.virus_batch.nil? ? "":p.virus_batch.id}
        @arr = @virus_batches.each_slice(4).to_a
        @users = User.all
      end
    end
end
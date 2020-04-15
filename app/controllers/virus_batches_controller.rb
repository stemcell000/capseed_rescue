class VirusBatchesController < InheritedResources::Base

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

def edit
  
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
    @columns = Column.all
    @rows = Row.all
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
  @virus_batch = VirusBatch.find(params[:id])
  @virus_production = VirusProduction.find(params[:virus_production_id])
    @boxes = Box.all
    @columns = Column.all
    @rows = Row.all
end


def update_from_inventory
  @virus_batch = VirusBatch.find(params[:id])
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


 def destroy_from_inventory
  @virus_batch = VirusBatch.find(params[:id])
  @virus_production  = VirusProduction.find(params[:virus_production_id])
  @virus_batches = @virus_production.virus_batches
    @virus_batch.toggle!(:trash)
    @virus_batch.update_columns(:volume => 0)
    garbage = Box.find_by_name("Garbage")
    
    unless @virus_batch.trash
      @virus_batch.update_columns(:volume => 0)
      garbage.virus_batches << @virus_batch
     else
      garbage.virus_batches.delete(@virus_batch)
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
      params.require(:virus_batch).permit(:id, :name, :barcode, :volume, :virus_production_id, :box_id, :trash, :row_id, :column_id, :vol_unit_id, :comment, :date, :date_of_thawing,
      virus_production_ids: [],
      :virus_production_attributes =>[:id, :nb])
    end
    
end


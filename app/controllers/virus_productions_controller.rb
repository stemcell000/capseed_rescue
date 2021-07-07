class VirusProductionsController < InheritedResources::Base
 
   before_action :set_virus_production, only:[:edit, :destroy, :edit_from_inventory, :add_vb_from_inventory, :spawn_dosage, :update, :update_from_inventory, :create_dosage,
                                                :sort_tube, :map_tube, :update_box, :unsort, :hide_from_inventory, :show]
   before_action :set_option, only:[:index, :update_from_inventory, :edit_from_inventory, :hide_from_inventory, :show]
  
 def index
   #"between search": recherche dans un range de dates
      #Formattage des dates
      start_time = params[:created_at_gteq].to_date rescue Date.current
      start_time = start_time.beginning_of_day # sets to 00:00:00
      end_time = params[:created_at_lteq].to_date rescue Date.current
      end_time = end_time.end_of_day # sets to 23:59:59
      
      start_prod_time = params[:date_of_production_gteq].todate rescue Date.current
      start_prod_time = start_prod_time.beginning_of_day # sets to 00:00:00
      end_prod_time = params[:date_of_production_lteq].to_date rescue Date.current
      end_prod_time = end_prod_time.end_of_day # sets to 23:59:59
      
    #Champ select pour "step" (champ de Production) et "projects" 
    
      @users_all = User.all.order(lastname: "asc").uniq
      @users_all = @users_all.map{ |obj| [(obj['firstname']+" "+obj['lastname']), obj['id']] }

      @plasmid_batches_all = PlasmidBatch.all.order(:id)
      @plasmid_batches_all = @plasmid_batches_all.map{|obj| [obj['name']] }
      
    #Champs genes
      @genes_all = Gene.all.order(name: "asc").uniq
      @genes_all = @genes_all.map{ |obj| [obj['name'], obj['id']] }

    #Champs promoters
      @promoters_all = Promoter.all.order(name: "asc").uniq
      @promoters_all = @promoters_all.map{ |obj| [obj['name'], obj['id']] }
      #Champs projects
      @projects_all = Project.all.order(name: "asc").uniq
      @projects_all = @projects_all.map{ |obj| [obj['name'], obj['id']] }  
      #Champ Plasmid
      @clone_batches_all = CloneBatch.all.order(name: "asc").uniq
      @clone_batches_all = @clone_batches_all.map{ |obj| [obj['name'], obj['id']] }  
      @option = current_user.options.first
      
    #virus cachés
      unless @option.display_all_virus
        unless @option.virus_productions.empty?
          hidden_virus_ids = @option.virus_productions.pluck(:id)
        end
      else
        hidden_virus_ids = []
      end
      #
      @q = VirusProduction.ransack(params[:q])
      
      records = @q.result.includes([:production, :plasmid_batches, :clone_batches, :sterilitytests, :genes, :user ]).where.not(:id => hidden_virus_ids).distinct

      #Config de l'affichage des résultats.
    
    @pagy, @virus_productions = pagy(records.order(nb: :desc), items: 30)

    respond_to do |format|
      format.html
      format.js
      format.csv {send_data records.to_csv, :filename => "virus-#{Date.today.strftime('%m/%d/%Y')}.csv"}
    end
  end

  def new
    @virus_production = VirusProduction.new
  end
  
  def create
        @virus_production = VirusProduction.create(virus_production_params)
      if  @virus_production.valid?
          flash.keep[:success] = "Task completed!"
          @virus_production.generate_recap
          redirect_to eval(params[:redirect_location])
      else
          render :action => :new
      end
  end
   
  def edit
    @users = User.all
  end
 
  def update
   @production = @virus_production.production
   @vps = @production.virus_productions
   #
   @virus_production.update_attributes(virus_production_params)
    if @virus_production.valid?
      flash.keep[:success] = "Task completed!"
      @virus_production.generate_recap
    else
      render :action => 'edit'
    end
  end

  def show
  end
  
  #def edit_from_inventory
   #   @users = User.all
    #  if @option.virus_productions.exists?(:id => @virus_production.id)
     #   @virus_production.hidden = true
     # end
  #end
  
  #def update_from_inventory
   #   @virus_production.update_attributes(virus_production_params)
    #  if @virus_production.valid?
     #     flash.keep[:success] = "Task completed!"
      #    @virus_production.generate_recap
      #else
       #   render :action => 'spawn_dosage'
      #end
  #end 
  
  def destroy
     @vps = VirusProduction.all
     @virus_production.destroy
  end
  
  def spawn_dosage
    @virus_production = VirusProduction.find(params[:id])
    @users = User.all
  end
  
  def create_dosage
    production = @virus_production.production
    @vps = production.virus_productions
     @virus_production.update_attributes(virus_production_params)
     if @virus_production.valid?
      flash.keep[:success] = "Task completed!"
      @virus_production.generate_recap
     else
      render :action => 'spawn_dosage'
    end
  end

  def spawn_sterilitytest
    @virus_production = VirusProduction.find(params[:id])
    @users = User.all
  end
  
  def create_sterilitytest
    production = @virus_production.production
    @vps = production.virus_productions
     @virus_production.update_attributes(virus_production_params)
     if @virus_production.valid?
      flash.keep[:success] = "Task completed!"
      @virus_production.generate_recap
     else
      render :action => 'spawn_sterilitytest'
    end
  end
  
  def add_vb_from_inventory
    @users = User.all
    @virus_batches = @virus_production.virus_batches
    @arr = @virus_batches.each_slice(4).to_a
  end
  
  def sort_tubes
    @boxes = Box.all
  end
  
  def map_tube
    set_box_map
    respond_to do |format|
      format.js
    end
  end
  
  def update_box
    position = Position.find(params[:position_id])
    @virus_batch = VirusBatch.find(params[:virus_batch_id])
    @virus_batch.position = position
    @virus_batch.save!
    set_box_map
    #
    respond_to do |format|
      format.js
    end
  end
  
 def hide_from_inventory
    unless @option.virus_productions.where(:id => @virus_production.id).exists?
      @option.virus_productions << @virus_production
    else
      @option.virus_productions.destroy(@virus_production)
    end
      redirect_to virus_productions_path
 end
 
 def set_box_map
    @box = Box.find(params[:box_id])
    @box_type = @box.box_type
    @v_max = @box_type.vertical_max
    @h_max = @box_type.horizontal_max

    @position_ids = @box.positions.order(:nb).pluck(:id)
    @position_nbs = @box.positions.order(:nb).pluck(:nb)
    @position_names = @box.positions.order(:nb).map{|p|p.name.upcase()}
    @position_batch_names = @box.positions.order(:nb).map{|p| p.virus_batch.nil? ? "":p.virus_batch.name}
    @position_batch_ids = @box.positions.order(:nb).map{|p| p.virus_batch.nil? ? "":p.virus_batch.id}
    @virus_batches=@virus_production.virus_batches
    @arr = @virus_batches.each_slice(4).to_a
    @users = User.all 
end
   
  private
 
  def virus_production_params
    params.require(:virus_production).permit(:id, :number, :nb, :plate_name, :vol, :sterility, :titer_atcc, :titer, :titer_to_atcc, :comment, :date_of_production, :user_id,
    :gel_prot, :invoice, :hek_result, :created_at, :updated_at, :vol_unit_id, :production_id, :_destroy, :plasmid_tag, :plasmid_batch_tag, :rev_plasmid_tag, :rev_plasmid_batch_tag,
    :dismissed, :hidden, :redirect_location,
    :dosages_attributes => [:id, :virus_production_id, :titer, :titer_atcc, :titer_to_atcc, :date, :plate_name, :_destroy, :remove_dosage,
    :inactivation, :inactivation_atcc, :inactivation_standard, :accepted, :user_id],
    :sterilitytests_attributes => [:id, :virus_production_id, :sterility, :date, :_destroy, :remove_sterilitytest],
    :virus_batches_attributes => [:id, :barcode, :name, :box_id, :volume, :vol_unit_id, :row_id, :column_id, :date_of_thawing ],
    :users_attributes =>[:id, :firstname, :lastname], user_ids: [])
  end
  
 def set_virus_production
   @virus_production = VirusProduction.find(params[:id])
   @production = @virus_production.production
 end
 
 def set_option
   @option = current_user.options.first
 end
 
end


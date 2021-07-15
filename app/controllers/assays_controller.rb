class AssaysController < ApplicationController
   
    before_action :authenticate_user!
    before_action :scheduler, only: [:index]
    before_action :assay_params, only:[:create, :update_row_order, :update, :add_clone]
    before_action :set_params, only:[:get_line, :update, :mask_line, :show, :clone_design, :clone_batch, :clone_batch_nb_update, :clone_batch_select, :clone_batch_qc, :plasmid_design, :plasmid_batch, :plasmid_batch_qc,
      :edit, :watch, :destroy, :clone_info, :plasmid_info, :close, :complete]
    before_action :ranked_assays, only: :index
    helper_method :sort_column, :sort_direction
    
  # GET /assays
  # GET /assays.json 
  def index
    @assays = Assay.where.not(:last_step => 8).rank(:row_order).all
    ##update des dates de process en cours
    @assays.each do |a|
      if !a.locked
        a.update_columns(:today_date => Date.today)
      end
    end
    
  end
  
  # GET /assays/1
  # GET /assays/1.json
  def show
    @clones = @assay.clones.order(:id)
    redirect_to :action => :clone_design
  end
  
  def update_row_order
    @assay = Assay.find(assay_params[:assay_id])
    @assay.row_order_position = assay_params[:row_order_position]
    @assay.save
    head :ok
  end
  
  # Fonctions pour Smart Listing
  def display_all
    #Liste des projets.
    @projects_all = Project.all
    
    #Recherche sur tables multiples.
      @q = Assay.ransack(params[:q])
      @assays = @q.result(distinct: true).includes(:clones)
    
    #Config de l'affichage des résultats.
    @assays = smart_listing_create(:assays, @assays, partial: "assays/smart_listing/list", default_sort: {id: "asc"}, page_sizes: [10, 20, 30, 50, 100])  
  end
  
  def scheduler
    refresh_statistics
    
    #Gantt Chart
    
    if params[:label].nil?
     
     @assays = Assay.all.where.not(:last_step => 8).order(:created_at)
    
    else
    
      @l = stringToStep(params[:label]).to_i
    
      @assays = Assay.where(:last_step => @l).order(:created_at)
    
    end
    
    gon.watch.rabl "app/views/assays/scheduler.json.rabl", as: "assays"
    
    
    
    #Pie Chart
     @statistics = Statistic.all
     
    gon.rabl "app/views/statistics/get_stats.json.rabl", as: "statistics"
    
    respond_to do |format|
      format.js
      format.html
    end
    
  end
  
  def refresh_statistics
    Statistic.destroy_all
    assay_collection = Assay.where("last_step < ?", 8).group(:last_step).count
    assay_collection.each do |ac|
      label = stepToString(ac[0])
      q = ac[1]
      @stat = Statistic.where(:label => label).first_or_initialize
      @stat.value = q
      @stat.save
    end
    
  end
  
  def reset_cloning_table
    @assays = Assay.all.where.not(:last_step => 8).order(:created_at)
    
    gon.rabl "app/views/assays/scheduler.json.rabl", as: "assays"
    
     respond_to do |format|
      format.js
    end
  end

  def new
    @assay = Assay.new
    @assay.projects.build
    @assay.save!
  end
  
  def assay_generator
    @assay = Assay.new
    @assay.save
      @assay.update_columns(:step => 1)
      update_last_step(@assay, 1)
      @assay.update_columns(:percentage => 10)
      
      redirect_to :action => 'clone_design', :id => @assay.id
  end
  
  
  def create
    #Create new assay
    @assay = Assay.create(assay_params)
    if @assay.save
      flash.keep[:success] = "Assay was successfully created!"
      redirect_to @assay
      @assay.update_columns(:step => 0)
      update_last_step(@assay, 0)
      @assay.update_columns(:percentage => 10)
    else
      render :action => 'new'
    end
  end
  

  def edit
    if !@assay.locked
      @assay.update_columns(:step => 0)
      @assay.update_columns(:percentage => 10)
    end
  end
    
  def update
     @projects_all = Project.all
     @assay.update_attributes(assay_params)
     if @assay.valid?
      flash.keep[:success] = "Task completed!"
      #redirect_to @assay
      redirect_to :action => :clone_design
          if @assay.clones.length > 0
            @assay.update_columns(:step => 0)
            @assay.update_columns(:percentage => 20)
          end
    else
      render :action => 'edit'
    end
  end
  
  def get_line
  end

  def mask_line
    @assay.display = false
    @assay.save
    flash[:notice] = "Successfully destroyed assay."
    redirect_to :action => "index"
  end
  
 def destroy
  @assay.destroy
  @assays = Assay.where.not(:last_step => 8).rank(:row_order).all
end
  
 def get_id
      @assay = Assay.find(params[:id])
 end
    
#PAGES

#page clone design
 def clone_design
    @clones = @assay.clones.order(:id)
    if @assay.clones.length > 0
          @assay.update_columns(:step => 1)
          @assay.update_columns(:percentage => 20)
          update_last_step(@assay, 1)
          @assay.clones.update_all(:strict_validation => 0)
          set_plasmid_validation(0, @assay)
          set_strict_validation(1, @assay)
    end
  end
  
 #page clone batch 
  def clone_batch
    @clones = @assay.clones.order(:id)
    if @clones.empty?
      flash.keep[:notice] = "Add a clone please."
      redirect_to :action => :clone_design
    else
      @assay.update_columns(:step => 2)
      @assay.update_columns(:percentage => 30)
      update_last_step(@assay, 2)
      #@assay.clones.update_all(:strict_validation => 1)
      set_plasmid_validation(0, @assay)
      set_strict_validation(0, @assay)
      
    end
  end
  
 #page clone batch qc
  def clone_batch_qc
    
      @clones = @assay.clones.order(:id)
      
       if @clones.empty?
      flash[:notice] = "Add a clone please."
      redirect_to :action => :clone_design
      else if @clones.any? { |c| c.batch_nb.blank? }
       flash[:notice] = "Add info please."
       redirect_to :action => :clone_batch
      else
        @assay.update_columns(:step => 3)
        @assay.update_columns(:percentage => 40)
        update_last_step(@assay, 3)
        @assay.clones.update_all(:strict_validation => 1)
        set_plasmid_validation(0, @assay)
        set_strict_validation(1, @assay)
        
     end
   end
  end
  
 #page plasmid_design
  def plasmid_design
     @clones = @assay.clones.order(:id)
      clone_ids = []
      cb_collection = []
      clone_ids = @clones.pluck(:id)
      cb_collection = CloneBatch.joins(:clone).where(clones: {id: clone_ids})
      
      if @clones.any? {|c| c.clone_batches.where.not(:name => nil).size == 0 }
        #
        redirect_to :action => :clone_batch_qc
        flash[:notice] = "Add a final name for each batch (click 'Rename')."
        set_plasmid_validation(0, @assay)
        set_strict_validation(1, @assay)
        @assay.clones.update_all(:strict_validation => 1)
        #
      else
        #
        @assay.update_columns(:step => 4)
        @assay.update_columns(:percentage => 50)
        update_last_step(@assay, 4)
        set_plasmid_validation(1, @assay)
        set_strict_validation(0, @assay)
        @assay.clones.update_all(:strict_validation => 0)
        #
     end
  end
  
  def plasmid_batch
    clone_ids= []
    @clones = @assay.clones.order(:id)
    clone_id = @clones.pluck(:id)
    cb_collection = CloneBatch.joins(:clone).where(clones: {id: clone_ids}).where.not(nb: nil) 
    switch = cb_collection.any?{|cb| cb.strand.nil? || cb.type.nil?}
   
    if cb_collection.any?{|cb| cb.strand.nil? || cb.type.nil?}
        flash[:notice] = "Complete information for each plasmid."
        redirect_to :action => :plasmid_design
        set_plasmid_validation(1, @assay)
        set_strict_validation(0, @assay)
    else   
        @assay.update_columns(:step => 5)
        @assay.update_columns(:percentage => 60)
        update_last_step(@assay, 5)
        set_plasmid_validation(0, @assay)
        set_strict_validation(1, @assay)
        @assay.clones.update_all(:strict_validation => 1)
     end
  end
  
  def plasmid_batch_qc
    
   @clones = @assay.clones.order(:id)
   clone_ids= []
   clone_batch_ids =[]
   pb_collection = []
     
    @clones = @assay.clones.order(:id)
    #Array des ids de clones de cet assay.
    clone_ids = @clones.pluck(:id)
    #collection de clone batches qui ont un numéros rattachés au clones.
    cb_collection = CloneBatch.joins(:clone).where(clones: {id: clone_ids}).where.not(nb: nil)
    
    clone_batch_ids = cb_collection.pluck(:id) 
       
    if cb_collection.any? {|cb| cb.plasmid_batches.empty?}
        flash[:notice] = "Add at least one batch for each plasmid."
        redirect_to :action => :plasmid_batch
    else 
       @assay.update_columns(:step => 6)
       @assay.update_columns(:percentage => 70)
       update_last_step(@assay, 6)
       set_plasmid_validation(1, @assay)
       set_strict_validation(0, @assay)
       @assay.clones.update_all(:strict_validation => 1)
     end
     
  end
  
  def close
    @clones = @assay.clones.order(:id)
      @cb_collection = []
      @pb_collection = []
      @plasmid_batches = []
    ##Collection of clone_batches (= plasmids)
    @clones.each do |c|
      @cb_collection = c.clone_batches.where.not(:name => nil).order(:id) + @cb_collection
    end
    ##Collection of plasmid_batches
      @cb_collection.each do |cb|
      @pb_collection = cb.plasmid_batches + @pb_collection
    end
    #
         @cb_collection.each do |cb|
            @plasmid_batches = cb.plasmid_batches.where(:qc_validation => true).order(:id) + @plasmid_batches
         end
         
    # conditions => pas de cloture avant d'avoir au moins créé un plasmide (clone_batch).     
         if @assay.last_step > 5 
            @assay.update_columns(:step => 7)
            @assay.update_columns(:percentage => 80)
            update_last_step(@assay, 7)
            set_plasmid_validation(1, @assay)
            set_strict_validation(0, @assay)
            @assay.clones.update_all(:strict_validation => 1)
         else
            flash[:notice] = "You need to complete the early steps first!."
             steppath = formatStep(@assay.last_step, @assay.id)[:step_path]
            redirect_to steppath
         end
  end
  
  def complete
          @assay.update_columns(:step => 8)
          @assay.update_columns(:percentage => 100)
          update_last_step(@assay, 8)
          flash[:success] = "Cloning completed!"
          redirect_to :action => 'close'
          set_plasmid_validation(1, @assay)
          set_strict_validation(0, @assay)
          inform_closed_assay
   end
  
  def lock_process
    @assay = Assay.find(params[:id])
    @clones = @assay.clones
    
    @cb_collection = []
    ##Collection of clone_batches (= plasmids)
    @clones.each do |c|
      @cb_collection = c.clone_batches.where.not(:name => nil).order(:id) + @cb_collection
    end
   
      if(@assay.locked == false)
        @assay.update_columns(:locked => true)
      else
        @assay.update_columns(:locked => false)
      end
      
  end
  
    def set_plasmid_validation(i, assay)
        assay.clones.each do |c|
          c.clone_batches.where.not(:name => nil).update_all(:plasmid_validation => i)
        end
     end
        
    def set_strict_validation(i, assay)
      assay.clones.each do |c|
          c.clone_batches.where.not(:name => nil).update_all(:strict_validation => i)
        end 
    end
    
  def inform_closed_assay
    @assay = Assay.find(params[:id])
    assay = @assay
    AssayNotifier.notify_closed_assay(@assay).deliver_now
    flash.keep[:success] = "Cloning closed. An e-mail has been sent to the administrators."
  end
  
  private
    
    # Default values for table sorting.
    def sort_column  
      Assay.column_names.include?(params[:sort]) ? params[:sort] : "created_at"  
    end  
     
   def sort_column_by_name
      Assay.column_names.include?(params[:sort]) ? params[:sort] : "name"  
   end
       
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"  
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def assay_params
      params.require(:assay).permit(:id, :assay_id, :user_id, :name, :assaynb, :startdate, :created_at , :updated_at , :step, :last_step, :assaynb, :row_order_position, :display , :locked,
      project_ids: [], clone_batch_ids: [],
      :projects_attributes => [:id, :name],
      :user_attributes => [:id, :name],
      :clones_attributes => [:id, :name, :primerinsfor, :primerinsrev, :bbnb, :comment, :comment_batch, :batch_nb, :strict_validation,
      :clone_batches_attributes => [:id, :name, :temp_name, :comment, :plasmid_validation, :strict_validation, :assay_id, :_destroy, :strand_id, :type_id, :date_as_plasmid, :glyc_stock_box_as_plasmid,
        :comment_as_plasmid, :qc_validation,
        :unit_attributes =>[:id, :name],
        :strand_attributes =>[:id, :name],
        :origin_attributes =>[:id, :name],
        :type_attributes =>[:id, :name],
        :promoters_attributes =>[:id, :name],
        :genes_attributes =>[:id, :name],
        :plasmid_batch_qcs_attributes =>[:id, :plasmid_batch_id, :dig_saml, :dig_other, :comments, :conclusion]
        ],
      :clone_attachments_attributes =>[:id,:clone_id, :attachment, :_destroy, :remove_attachment]])
       end

    def set_params
      @assay = Assay.find(params[:id])
    end
    
   def ranked_assays
    #Refresh the collection of assays
    @assays = Assay.rank(:row_order).where.not(step: "completed" , display: false)
   end
    
  def pagination_links(collection, options = {})
     options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
     options[:class] ||= 'pagination pagination-centered'
     options[:inner_window] ||= 2
     options[:outer_window] ||= 1
     will_paginate(collection, options)
  end
  
    
  def sort_column
    Assay.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def cb_generator(c)
    if c.changed
      #Suppression de touts les batches avant recréation
      if !c.clone_batches.empty?
        c.clone_batches.delete_all
      end
      #Nommage (temp_name) et création du nombre de batch indiqués +  ajout à la collection.
      i = 1
      c.batch_nb.times do
        temp =c.name+'_'+i.to_s
        cb = CloneBatch.create(:temp_name => temp)
        c.clone_batches << cb
        i += 1
      end
    end
end
   
  end

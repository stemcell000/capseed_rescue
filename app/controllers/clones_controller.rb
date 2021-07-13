class ClonesController < ApplicationController

autocomplete :clone, :name, :full => true, :extra_data => [:id], :display_value => :display_method, :limit => 100, :order => :id
    
before_action :load_assay, only:[:edit, :new, :edit_record, :edit_batch, :edit_batch_select, :update, :create, :autocm, :destroy, :replicate, :update_record, :update_record_batch, :update_record_batch_select,
  :update_record_batch_qc, :clone_info]
before_action :set_param, only: [:update, :edit, :cb_generator, :edit_record, :edit_batch_select, :update_record, :update_record_batch, :update_record_batch_select,
  :update_from_inventory, :edit_from_inventory]
before_action :clone_params, only: [:update, :update_clone, :create, :edit, :update_record_batch]
skip_before_action :verify_authenticity_token, :only => :update_record_batch

@@old_id =0

def index
  #Formattage des dates
    start_time = params[:created_at_gteq].to_date rescue Date.current
    start_time = start_time.beginning_of_day # sets to 00:00:00
    end_time = params[:created_at_lteq].to_date rescue Date.current
    end_time = end_time.end_of_day # sets to 23:59:59
    
  #Projects 
    @projects_all = Project.all.order(name: "asc").uniq
    @projects_all = @projects_all.map{ |obj| [obj['name'], obj['id']] }
    
  #Champ inserts
    @inserts_all = Insert.all.where(:dismissed => 0).order(:name)
    @inserts_all = @inserts_all.map{ |obj| [obj['name'], obj['id']] }
  
  #Recherche sur tables multiples.
    @q = Clone.joins([:inserts, :backbones]).select('id', 'name', 'cmeth_id', 'primer_f_id', 'primer_r_id', 'comment').ransack(params[:q])
    records = @q.result
  
  #Config de l'affichage des résultats.
    @pagy, @clones = pagy(records.order(name: :desc), items: 30)
end

def new
  
    #initialisation de la liste des enzymes
    @enzymes_all = Enzyme.all.order(:name)
    #initialisation de la liste des méthodes
    @cmeths_all = Cmeth.all.order(:name)
    #initialisation de la liste des inserts
    
    #initialisation de la liste des projets
    @projects_all =Project.all.order(:name)
    
  #Genere un nouveau clone pour la methode create
  #Si le formulaire contient un champ :id non vide, alors on charge le même formulaire en 'edit'.
  
  if params[:id]
    @clone = Clone.find(params[:id])
    @@old_id = params[:id]
    @clone_enzymes = @clone.enzymes.build
    @clone_inserts = @clone.inserts.build
    @clone_batches = @clone.clone_batches.build
    @clone.projects.build
    
    render 'edit'
  else
    @clone = @assay.clones.new
    @clone_enzymes = @clone.enzymes.build
    @clone_inserts = @clone.inserts.build
    @clone.clone_batches.build
    @clone.projects.build
  end

end

def create
  #initialisation de la liste des enzymes backbones.
  @enzymes_all = Enzyme.all.order(:name)
  #initialisation de la liste des méthodes
  @cmeths_all = Cmeth.all.order(:name)
  #initialisation de la liste des inserts.
  @inserts_all = Insert.all.order(:name)
  #initialisation de la liste des projets
  @projects_all =Project.all.order(:name)
    #Le paramètre à prendre en compte ici est l':id. si on prend le nom ("name"), pas de validation.
        @clone = Clone.where(:name => params[:clone][:id]).first_or_create(clone_params)
        @clones = @assay.clones.all
      if @clone.valid?
        @assay.clones << @clone
        flash.keep[:success] = "Task completed!"
      else
        render :action => 'new'
      end
end

def show
 
end

def edit
  @clones = @assay.clones.build
  @assays = @clone.assays.build
  @assays_count = @clone.assays.count
  #initialisation de la liste des enzymes backbones.
  @enzymes_all = Enzyme.all.order(:name)
  #initialisation de la liste des méthodes
  @cmeths_all = Cmeth.all.order(:name)
  #initialisation de la liste des inserts.
  @inserts_all = Insert.all.order(:name)
  #initialisation de la liste des projets
  @projects_all =Project.all.order(:name)
  #
  @clone_enzymes = @clone.enzymes.build
  @clone_inserts = @clone.inserts.build
  @clone_batches = @clone.clone_batches.build
  @assay.projects.build
  @@old_id = params[:id]
end
  
def update
  @clones = @assay.clones.all
  #initialisation de la liste des enzymes backbones.
  @enzymes_all = Enzyme.all.order(:name)
  #initialisation de la liste des méthodes
  @cmeths_all = Cmeth.all.order(:name)
  #initialisation de la liste des inserts.
  #@inserts_all = Insert.all.order(:name)
  #initialisation de la liste des projets
  @projects_all =Project.all.order(:name)
  #
  if !@assay.clones.where(:id => @@old_id).present?
        if @assay.clones << @clone
          flash.keep[:success] = "Task completed!"
          redirect_to assay_path(@assay)
         else
           render :action => 'edit'
         end
       else
          flash.keep[:notice] = "This clone is already associated!"
          redirect_to @assay
   end
end

def edit_record
  @clones = @assay.clones.build
  #initialisation de la liste des enzymes
  @enzymes_all = Enzyme.all.order(:name)
  #initialisation de la liste des méthodes
  @cmeths_all = Cmeth.all.order(:name)
  #initialisation de la liste des inserts.
  @inserts_all = Insert.all.order(:name)
  #initialisation de la liste des projets
  @projects_all =Project.all.order(:name)
  #
  @clone_enzymes = @clone.enzymes.build  
  @clone_insert = @clone.inserts.build
  @clones_projects = @clone.projects.build
end

def update_record
  @clones = @assay.clones
  if @clone.update_attributes(clone_params)
      flash.keep[:success] = "Task completed!"
      #redirect_to @assay
    else
      render :action => 'edit'
    end
end

def replicate
  @clone = Clone.find(@@old_id)
    @clones = @assay.clones.build
  #initialisation de la liste des enzymes
  @enzymes_all = Enzyme.all.order(:name)
  #initialisation de la liste des méthodes
  @cmeths_all = Cmeth.all.order(:name)
  #initialisation de la liste des inserts.
  @inserts_all = Insert.all.order(:name)
  #initialisation de la liste des projets
  @projects_all =Project.all.order(:name)
  @clone = @clone.amoeba_dup
  render :new  
end

def destroy
  @clones = @assay.clones.all
  @clone = Clone.find(params[:id])
  @clone.destroy
end

def destroy_from_inventory
  @clone = Clone.find(params[:id])
  @clone.destroy
end

def edit_batch
  @clones = @assay.clones.build
  @clones = @assay.clones.order(:id)
  @assay.clones.build
  @clone = Clone.find(params[:id])
end

def update_record_batch
  @clones = @assay.clones.order(:id)
  
 #TUTO: Ici on doit pouvoir changer le parametre batch_nb pour générer le nombre de batches correspondant.
 #Si par la suite on ajoute des données aux batches générés,
 #Il faut donc utiliser le module Dirty pour tracer si oui ou non il y a eu changement de valeurs pour batch_nb.
 #Si oui, on détruit les anciens et on génére de nouveaux batches (et on efface toutes les données associées), si non, on ne fait rien.
 #si on utilise: @clone.update_attributes(clone_params), Dirty ne fonctionne pas car update_attributes réinitialise le modèle
 #Il faut donc utiliser assign_attributes + save
 
  @clone.assign_attributes(clone_params)
  cb_generator
     if @clone.save(validate: false)
       flash.keep[:success] = "Task completed!"
       @clone.save
      else
        render :action => 'edit_batch'
      end
end


def edit_batch_select
  @clones = @assay.clones.build
  @clones = @assay.clones.order(:id)
  @assay.clones.build
  #Génère le nombre de champs nécessaires dans le formulaire, sans le dépasser.
  if @clone.clone_batches.size < @clone.batch_nb
    (@clone.batch_nb-@clone.clone_batches.size).times do
      @clone.clone_batches.build
    end
  end
end

def update_record_batch_select
  @clones = @assay.clones.order(:id)
  @clone.update_attributes(clone_params)
  @clone_batches_counter = @clone.clone_batches.all.size
   if @clone.valid?
      flash.keep[:success] = "Task completed!"
      respond_to :js
    else
      render :action => 'edit_batch_select'
    end
end

def edit_batch_qc
  @clones = @assay.clones.build
  @assays = @clone.assays.build
  @clones = @assay.clones.order(:id)
  @assay.clones.build
  @clone.clone_batches.build
end

def update_record_batch_qc
  @clones = @assay.clones.order(:id)
  @clone.update_attributes(clone_params)
   if @clone.valid?
      flash.keep[:success] = "Task completed!"
      respond_to :js
    else
      render :action => 'edit_batch_qc'
    end
end

def switch_qc_table
  @clones = @assay.clones.order(:id)
end

def clone_info
   id = params[:clone_id]
  @clone = Clone.find(id)
  @clones = @assay.clones.order(:id)
  #@page_tab = "clone"
  respond_to do |format|
    format.js
  end
end

def plasmid_info
  clone_id = params[:clone_id]
  assay_id = params[:assay_id]
  @clone = Clone.find(clone_id)
  @assay = Assay.find(assay_id)
  respond_to do |format|
    format.js
  end
end

def plasmid_info_close
  #rappel: les plasmid sont en fait les clone_batches.
  clone_id = params[:clone_id]
  assay_id = params[:assay_id]
  @clone = Clone.find(clone_id)
  @assay = Assay.find(assay_id)
  @clone.clone_batches.build
  respond_to do |format|
    format.js
  end
end

def plasmid_batch_info
  clone_id = params[:clone_id]
  assay_id = params[:assay_id]
  @clone = Clone.find(clone_id)
  @assay = Assay.find(assay_id)
  respond_to do |format|
    format.js
  end
end


def plasmid_batch_qc_info
    clone_id = params[:clone_id]
  assay_id = params[:assay_id]
  @clone = Clone.find(clone_id)
  @assay = Assay.find(assay_id)
  respond_to do |format|
    format.js
  end
end

def edit_from_inventory
  @inserts_all = Insert.where(:dismissed => 0)
  @cmeths_all = Cmeth.all
  @primerf_all = PrimerF.all
  @primerr_all= PrimerR.all
end

def update_from_inventory
  @clone.attributes = clone_params
  if @clone.save!(validate: false)
      flash.keep[:success] = "Task completed!"
  else
    render :action => 'edit_from_inventory'
  end
end

def new_from_inventory
  @clone = Clone.new
  @inserts_all = Insert.where(:dismissed => 0)
  @cmeths_all = Cmeth.all
  @primerf_all = PrimerF.all
  @primerr_all= PrimerR.all
end

def create_from_inventory
    @clone = Clone.create(clone_params)
    #
    if  @clone.valid?
        flash.keep[:success] = "Task completed!"
    else
        render :action => :new_from_inventory
    end
end

private

def cb_generator
if @clone.changed?
      #Suppression de touts les batches avant recréation
      if !@clone.clone_batches.empty?
        @clone.clone_batches.destroy_all
      end
      #Nommage (temp_name) et création du nombre de batch indiqués +  ajout à la collection.
      i = 1
      @clone.batch_nb.times do
        temp =@clone.name+'_'+i.to_s
        #if CloneBatch.count > 0
         # new_nb = CloneBatch.last.number.to_i+1
        #else
         # new_nb = 1
        #end
        cb = CloneBatch.new(:temp_name => temp)
        
        cb.skip_name_validation = true
        cb.skip_type_validation = true
        
        if cb.save(validate: false)
          @clone.clone_batches << cb
         else
           flash.keep[:danger] = "Nothing happened!"
        end
        i += 1
      end
  end
end

def set_param
  @clone = Clone.find(params[:id])
end

def load_assay 
  @assay = Assay.find(params[:assay_id])
end

def clone_params
  params.require(:clone).permit( :id, :assay_id, :clones_id, :project_id, :cmeth_id, :name, :bbnb, :primer_f_id, :primer_r_id, :comment, :comment_batch, :batch_nb, :strict_validation,
  enzyme_ids: [],
  insert_ids: [],
  backbone_ids: [],
  cmeth_ids: [],
  project_ids: [],
  
  :projects_attributes => [:id, :clone_id, :name],
  :enzymes_attributes =>[:id, :clone_id, :name],
  :cmeth_attributes =>[:id, :name],
  :inserts_attributes =>[:id, :name, :clone_batch_id, :clone_id, :number],
  :bs_attributes =>[:id, :name, :clone_batch_id, :clone_id, :number],
  :assay_attributes => [:id, :name, :step],
  :clone_batches_attributes => [:clone_id, :name, :temp_name, :_destroy,
  :plasmid_batch_attributes => [:id, :clone_batch_id, :name, :format, :concentration, :_destroy],
  :unit_attributes =>[:id, :clone_batch_id, :name]],
  :clone_attachments_attributes =>[:id,:clone_id, :attachment, :remove_attachment, :_destroy])
end


end

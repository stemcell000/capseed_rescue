class DosagesController < ApplicationController

  before_action :dosage_params, only:[:create, :update]
  before_action :set_dosage, only: [:edit, :destroy, :update]
  before_action :set_collections, only:[:edit, :new, :create, :update, :destroy]

def new
  @dosage = Dosage.new
end

def create
  @dosage = Dosage.create(dosage_params)
    if @dosage.save
      flash.keep[:success] = "A new dosage has been successfully created!"
      redirect_to virus_production_path(@virus_production)
    else
      render :action => 'new'
    end
end

def edit
  
end

def update
    @dosage.update_attributes(dosage_params)
    if @dosage.save
      flash.keep[:success] = "A dosage has been successfully updated!"
      redirect_to virus_production_path(@virus_production)
    else
      render :action => 'new'
    end

end

def destroy
  @dosage = @virus_production.dosages.find(params[:id])
  @dosage.destroy
  redirect_to virus_production_path(@virus_production)
end

private

  def set_dosage
      @dosage = Dosage.find(params[:id])
  end

  def set_collections
    @users = User.all.order('lastname')
    @virus_production = VirusProduction.find(params[:virus_production_id])
  end
  
  def dosage_params
    params.require(:dosage).permit(:id, :virus_production_id, :titer, :titer_atcc, :titer_to_atcc, :user_id, :date, :plate_name, :_destroy, :inactivation,
      :inactivation_atcc, :inactivation_standard, :accepted)
  end  
end

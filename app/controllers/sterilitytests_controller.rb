class SterilitytestsController < InheritedResources::Base

  before_action :sterilitytest_params, only:[:create, :update]
  before_action :set_sterilitytest, only: [:edit, :destroy, :update]
  before_action :set_collections, only:[:edit, :new, :create, :update, :destroy]

def new
  @sterilitytest = Sterilitytest.new
end

def create
  @sterilitytest = Sterilitytest.create(sterilitytest_params)
    if @sterilitytest.save
      flash.keep[:success] = "A new sterilitytest has been successfully created!"
      redirect_to virus_production_path(@virus_production)
    else
      render :action => 'new'
    end
end

def edit
  
end

def update
    @sterilitytest.update_attributes(sterilitytest_params)
    if @sterilitytest.save
      flash.keep[:success] = "A sterilitytest has been successfully updated!"
      redirect_to virus_production_path(@virus_production)
    else
      render :action => 'new'
    end

end

def destroy
  @sterilitytest = @virus_production.sterilitytests.find(params[:id])
  @sterilitytest.destroy
  redirect_to virus_production_path(@virus_production)
end

private

  def set_sterilitytest
      @sterilitytest = Sterilitytest.find(params[:id])
  end

  def set_collections
    @users = User.all.order('lastname')
    @virus_production = VirusProduction.find(params[:virus_production_id])
  end
  
  def sterilitytest_params
    params.require(:sterilitytest).permit(:id, :virus_production_id, :date, :sterility, :user_id)
  end 
end


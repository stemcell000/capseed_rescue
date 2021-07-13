class EnzymesController < ApplicationController
  
  before_action :enzyme_params, only:[:create, :update]
  before_action :find_enzyme, only: [:edit, :destroy, :update]
  
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
 def new
   @enzyme = Enzyme.new
 end
 
 def edit
 end
 
  def create
    @enzyme = Enzyme.create(enzyme_params)
    if @enzyme.save
      flash.keep[:success] = "A new Enzyme has been successfully created!"
    else
      render :action => 'new'
    end
  end
  
  def update
     @enzyme.update_attributes(enzyme_params)
  end
 
 def index
      @q = Enzyme.ransack(params[:q])
      records = @q.result
      @pagy, @enzymes = pagy(records.order(name: :desc), items: 30)
 end
 
 def destroy
   @enzyme.destroy
 end
  
  private
   def enzyme_params
      params.require(:enzyme).permit(:name, :_destroy, :clone_id)
   end
   
   def find_enzyme
      @enzyme = Enzyme.find(params[:id])
   end
end

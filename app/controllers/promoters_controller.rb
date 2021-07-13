class PromotersController < ApplicationController
  
  before_action :promoter_params, only:[:create, :update]
  before_action :find_promoter, only: [:edit, :destroy, :update]
  
  
 def new
   @promoter = Promoter.new
 end
 
 
 def edit
 end
 
  def create
    @promoter = Promoter.create(promoter_params)
    if @promoter.save
      flash.keep[:success] = "A new promoter has been successfully created!"
    else
      render :action => 'new'
    end
  end
  
  def update
     @promoter.update_attributes(promoter_params)
  end
 
 def index
      @q = Promoter.ransack(params[:q])
      records = @q.result
      @pagy, @promoters = pagy(records.order(name: :desc), items: 30)
 end
 
 def destroy
   @promoter.destroy
 end
  
  private
   
   def find_promoter
      @promoter = Promoter.find(params[:id])
   end
 
   def promoter_params
      params.require(:promoter).permit(:id, :name)
   end
  

end

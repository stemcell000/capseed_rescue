class PrimersController < ApplicationController
  before_action :primer_params, only:[:create, :update]
  before_action :find_primer, only: [:edit, :destroy, :availability_switch, :update]
  
 def new
   @primer = Primer.new
 end
 
 def edit
 end
 
  def create
    @primer = Primer.create(primer_params)
    if @primer.save
      flash.keep[:success] = "A new primer has been successfully created!"
    else
      render :action => 'new'
    end
  end
  
  def update
     @primer.update_attributes(primer_params)
  end
 
 def index
      @q = Primer.ransack(params[:q])
      records = @q.result
      @pagy, @primers = pagy(records.order(name: :desc), items: 30)
 end
 
 def destroy
   @primer.destroy
 end
 
def availability_switch
  @primer.toggle! :available
  @primers = smart_listing_create(:primers, Primer.all, partial: "primers/list", default_sort: {id: "asc"},  page_sizes: [20,30,50, 100, 200])
end
  
  private
   def primer_params
      params.require(:primer).permit(:id, :name, :sequence, :_destroy, :available, :comment)
   end
   
   def find_primer
      @primer = Primer.find(params[:id])
   end
end

  

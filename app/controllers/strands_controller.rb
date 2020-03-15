class StrandsController < InheritedResources::Base

  private

    def strand_params
      params.require(:strand).permit()
    end
end


class ProductionsController < InheritedResources::Base

  private

    def production_params
      params.require(:production).permit()
    end
end


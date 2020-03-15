class GenesController < InheritedResources::Base

  private

    def gene_params
      params.require(:gene).permit()
    end
end


class AssaysController < InheritedResources::Base

  private

    def assay_params
      params.require(:assay).permit()
    end
end


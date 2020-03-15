class EnzymesController < InheritedResources::Base

  private

    def enzyme_params
      params.require(:enzyme).permit()
    end
end


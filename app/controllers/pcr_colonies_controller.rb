class PcrColoniesController < InheritedResources::Base

  private

    def pcr_colony_params
      params.require(:pcr_colony).permit()
    end
end


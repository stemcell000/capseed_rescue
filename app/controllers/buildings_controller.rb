class BuildingsController < InheritedResources::Base

  private

    def building_params
      params.require(:building).permit()
    end
end


class VolUnitsController < InheritedResources::Base

  private

    def vol_unit_params
      params.require(:vol_unit).permit()
    end
end


class DosagesController < InheritedResources::Base

  private

    def dosage_params
      params.require(:dosage).permit()
    end
end


class ClonesController < InheritedResources::Base

  private

    def clone_params
      params.require(:clone).permit()
    end
end


class OriginsController < InheritedResources::Base

  private

    def origin_params
      params.require(:origin).permit()
    end
end


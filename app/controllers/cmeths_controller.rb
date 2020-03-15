class CmethsController < InheritedResources::Base

  private

    def cmeth_params
      params.require(:cmeth).permit()
    end
end


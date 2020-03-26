class ContainersController < InheritedResources::Base

  private

    def container_params
      params.require(:container).permit()
    end
end


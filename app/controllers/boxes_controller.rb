class BoxesController < InheritedResources::Base

  private

    def box_params
      params.require(:box).permit()
    end
end


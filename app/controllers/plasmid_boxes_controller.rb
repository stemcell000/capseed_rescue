class PlasmidBoxesController < InheritedResources::Base

  private

    def plasmid_box_params
      params.require(:plasmid_box).permit()
    end
end


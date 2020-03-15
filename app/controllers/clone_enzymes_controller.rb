class CloneEnzymesController < InheritedResources::Base

  private

    def clone_enzyme_params
      params.require(:clone_enzyme).permit()
    end
end


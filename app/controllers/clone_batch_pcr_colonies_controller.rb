class CloneBatchPcrColoniesController < InheritedResources::Base

  private

    def clone_batch_pcr_colony_params
      params.require(:clone_batch_pcr_colony).permit()
    end
end


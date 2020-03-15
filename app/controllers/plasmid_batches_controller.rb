class PlasmidBatchesController < InheritedResources::Base

  private

    def plasmid_batch_params
      params.require(:plasmid_batch).permit()
    end
end


class PlasmidBatchProductionsController < InheritedResources::Base

  private

    def plasmid_batch_production_params
      params.require(:plasmid_batch_production).permit()
    end
end


class PlasmidBatchQcBatchesController < InheritedResources::Base

  private

    def plasmid_batch_qc_batch_params
      params.require(:plasmid_batch_qc_batch).permit()
    end
end


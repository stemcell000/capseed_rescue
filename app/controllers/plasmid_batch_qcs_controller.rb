class PlasmidBatchQcsController < InheritedResources::Base

  private

    def plasmid_batch_qc_params
      params.require(:plasmid_batch_qc).permit()
    end
end


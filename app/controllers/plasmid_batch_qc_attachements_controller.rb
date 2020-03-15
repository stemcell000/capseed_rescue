class PlasmidBatchQcAttachementsController < InheritedResources::Base

  private

    def plasmid_batch_qc_attachement_params
      params.require(:plasmid_batch_qc_attachement).permit()
    end
end


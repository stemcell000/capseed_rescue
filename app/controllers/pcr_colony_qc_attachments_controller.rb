class PcrColonyQcAttachmentsController < InheritedResources::Base

  private

    def pcr_colony_qc_attachment_params
      params.require(:pcr_colony_qc_attachment).permit()
    end
end


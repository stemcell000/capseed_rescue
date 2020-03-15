class QcAttachmentSequencingsController < InheritedResources::Base

  private

    def qc_attachment_sequencing_params
      params.require(:qc_attachment_sequencing).permit()
    end
end


class CloneAttachmentsController < InheritedResources::Base

  private

    def clone_attachment_params
      params.require(:clone_attachment).permit()
    end
end


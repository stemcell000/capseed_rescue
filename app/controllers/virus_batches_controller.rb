class VirusBatchesController < InheritedResources::Base

  private

    def virus_batch_params
      params.require(:virus_batch).permit()
    end
end


class CloneBatchesController < InheritedResources::Base

  private

    def clone_batch_params
      params.require(:clone_batch).permit()
    end
end


class CloneBatchProductionsController < InheritedResources::Base

  private

    def clone_batch_production_params
      params.require(:clone_batch_production).permit()
    end
end


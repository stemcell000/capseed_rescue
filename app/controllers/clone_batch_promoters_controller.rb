class CloneBatchPromotersController < InheritedResources::Base

  private

    def clone_batch_promoter_params
      params.require(:clone_batch_promoter).permit()
    end
end


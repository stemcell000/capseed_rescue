class CloneBatchOptionsController < InheritedResources::Base

  private

    def clone_batch_option_params
      params.require(:clone_batch_option).permit()
    end
end


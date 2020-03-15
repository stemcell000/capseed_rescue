class CloneBatchSequencingsController < InheritedResources::Base

  private

    def clone_batch_sequencing_params
      params.require(:clone_batch_sequencing).permit()
    end
end


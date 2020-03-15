class CloneBatchGenesController < InheritedResources::Base

  private

    def clone_batch_gene_params
      params.require(:clone_batch_gene).permit()
    end
end


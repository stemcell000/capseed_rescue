class CloneSamplesController < InheritedResources::Base

  private

    def clone_sample_params
      params.require(:clone_sample).permit()
    end

end

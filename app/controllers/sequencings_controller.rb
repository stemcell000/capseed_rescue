class SequencingsController < InheritedResources::Base

  private

    def sequencing_params
      params.require(:sequencing).permit()
    end
end


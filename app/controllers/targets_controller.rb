class TargetsController < InheritedResources::Base

  private

    def target_params
      params.require(:target).permit()
    end
end


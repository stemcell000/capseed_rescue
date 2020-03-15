class CloneInsertsController < InheritedResources::Base

  private

    def clone_insert_params
      params.require(:clone_insert).permit()
    end
end


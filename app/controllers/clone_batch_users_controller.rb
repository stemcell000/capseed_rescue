class CloneBatchUsersController < InheritedResources::Base

  private

    def clone_batch_user_params
      params.require(:clone_batch_user).permit()
    end
end


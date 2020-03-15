class CloneProjectsController < InheritedResources::Base

  private

    def clone_project_params
      params.require(:clone_project).permit()
    end
end


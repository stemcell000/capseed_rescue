class AssayProjectsController < InheritedResources::Base

  private

    def assay_project_params
      params.require(:assay_project).permit()
    end
end


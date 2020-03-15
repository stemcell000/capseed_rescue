class ProductionProjectsController < InheritedResources::Base

  private

    def production_project_params
      params.require(:production_project).permit()
    end
end


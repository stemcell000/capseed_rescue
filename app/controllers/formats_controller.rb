class FormatsController < InheritedResources::Base

  private

    def format_params
      params.require(:format).permit()
    end
end


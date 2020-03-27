class BoxFormatsController < InheritedResources::Base

  private

    def box_format_params
      params.require(:box_format).permit()
    end
end


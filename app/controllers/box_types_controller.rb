class BoxTypesController < InheritedResources::Base

  private

    def box_type_params
      params.require(:box_type).permit(:name, :max_position, :comment, :vertical_max, :horizontal_max)
    end
end


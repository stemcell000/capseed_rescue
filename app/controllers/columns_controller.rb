class ColumnsController < InheritedResources::Base

  private

    def column_params
      params.require(:column).permit()
    end
end


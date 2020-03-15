class RowsController < InheritedResources::Base

  private

    def row_params
      params.require(:row).permit()
    end
end


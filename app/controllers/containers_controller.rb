class ContainersController < InheritedResources::Base

  private

    def container_params
      params.require(:container).permit(:id, :name, :barcode,
      :shelf_attributes =>[:id, :name, :barcode])
    end
end


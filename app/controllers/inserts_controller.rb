class InsertsController < InheritedResources::Base

  private

    def insert_params
      params.require(:insert).permit()
    end
end


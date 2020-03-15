class PromotersController < InheritedResources::Base

  private

    def promoter_params
      params.require(:promoter).permit()
    end
end


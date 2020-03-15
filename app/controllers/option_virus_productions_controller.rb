class OptionVirusProductionsController < InheritedResources::Base

  private

    def option_virus_production_params
      params.require(:option_virus_production).permit()
    end
end


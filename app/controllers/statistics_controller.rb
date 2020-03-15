class StatisticsController < InheritedResources::Base

  private

    def statistic_params
      params.require(:statistic).permit()
    end
end


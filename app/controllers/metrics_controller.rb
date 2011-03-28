class MetricsController < ApplicationController

  def index
    @metrics = API::Metric.all
  end

  def show
    @metric = API::Metric.find(params[:id])
  end

  protected

end

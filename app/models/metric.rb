# All metrics are plotted over time.
# 
# Fields:
# * aggregate: the period of time over which the metric is aggregated.
#
class Metric
  include Mongoid::Document

  field :uid,        :type => String
  field :name,       :type => String
  field :short_name, :type => String
  field :unit,       :type => String
  field :cumulative, :type => Boolean
  field :aggregate,  :type => String
  field :chart_type, :type => String
  field :category,   :type => String

  references_and_referenced_in_many :projects

end

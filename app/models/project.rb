class Project
  include Mongoid::Document

  field :name,       :type => String
  field :short_name, :type => String
  field :url,        :type => String
  field :date,       :type => Date
  field :facets,     :type => Array

  references_and_referenced_in_many :metrics

end

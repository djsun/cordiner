def each_yaml(basename)
  filename = Rails.root.join("db", "#{basename}.yml")
  puts "Loading #{filename}"
  YAML.load_file(filename).each { |data| yield data }
end

each_yaml('metrics') do |metric_hash|
  metric = Metric.create!(metric_hash)
  puts "  - #{metric.name}"
end

each_yaml('projects') do |project_hash|
  fields = %w(name short_name date facets)
  project = Project.new(project_hash.slice(*fields))
  project_hash['metrics'].each do |metric_uid|
    metric = Metric.where(:uid => metric_uid).first
    if metric
      project.metrics << metric
    else
      raise "Cannot find metric with uid: #{metric_uid}"
    end
  end
  project.save!
  puts " - #{project.name}"
end

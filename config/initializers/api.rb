ConfigFile.load('api.yml') do |config|
  Cordiner::Application.config.api = {
    :host => config['host'],
    :key  => config['key']
  }
end

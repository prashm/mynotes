unless defined?(CONFIG)
  CONFIG = {}

  Dir.glob(Rails.root.join('config/*_config.yml')).each do |cf|
    namespace = cf.match(/\/([^\/]+)_config\.yml$/)[1].to_sym
    CONFIG[namespace] = YAML.load(File.read(cf))[Rails.env].deep_symbolize_keys
  end
end
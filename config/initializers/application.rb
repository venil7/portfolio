APP_CONFIG = YAML.load_file("#{::Rails.root.to_s}/config/application.yml")[Rails.env]
DISQUS = YAML.load_file("#{::Rails.root.to_s}/config/disqus.yml")
APP_TRACKING = YAML.load_file("#{::Rails.root.to_s}/config/tracking.yml")[Rails.env]

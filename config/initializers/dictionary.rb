Dictionary.configure YAML.load_file(File.join [Rails.root, 'config', 'dictionary.yml'])[Rails.env]

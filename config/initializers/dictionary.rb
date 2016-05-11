dictionary = YAML.load_file(File.join [Rails.root, 'config', 'dictionary.yml'])[Rails.env]
alphabet = []

dictionary['include'].each_slice(2).to_a.each do |j|
  alphabet += (j[0]..j[1]).to_a
end
dictionary['exclude'].each_slice(2).to_a.each do |j|
  alphabet -= (j[0]..j[1]).to_a
end

DICTIONARY_CONFIG = alphabet

class Dictionary
  @@alphabet = DICTIONARY_CONFIG
  @@base = DICTIONARY_CONFIG.length
  @@maxlength = 8

  def self.word_for number
    raise "Invalid base #{@@base}" if @@base == 0
    word = [].tap do |d|
      while number > 0
        d.unshift number % @@base
        number /= @@base
      end
    end
    word.map { |j| @@alphabet[j] }.pack 'U*'
  end

  def self.number_for word
    number = 0
    word.to_s.unpack('U*').select { |j| @@alphabet.include? j }.slice(0, @@maxlength).map { |j| @@alphabet.index j }.reverse.each_with_index { |j,k| number += (@@base ** k) * j }
    number
  end
end

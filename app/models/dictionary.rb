class Dictionary
  @@alphabet = []
  @@base = 0

  def self.word_for number
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
    word.unpack('U*').map { |j| @@alphabet.index j }.reverse.each_with_index { |j,k| number += (@@base ** k) * j }
    number
  end

  def self.configure(configuration)
    configuration['include'].each_slice(2).to_a.each do |j|
      @@alphabet += (j[0]..j[1]).to_a
    end
    configuration['exclude'].each_slice(2).to_a.each do |j|
      @@alphabet -= (j[0]..j[1]).to_a
    end
    @@base = @@alphabet.length
  end
end

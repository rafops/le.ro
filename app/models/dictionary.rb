class Dictionary
  @@alphabet = (10241..10495).to_a
  @@base = @@alphabet.length

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
end

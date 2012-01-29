class Shortening
  include MongoMapper::Document

  key :url, String, required: true
  key :number, Integer

  attr_protected :number
  before_save :generate_number
  validate :url_validation

  def shortened
    Dictionary.word_for number unless number.nil?
  end

  def url_validation
    if (url =~ URI::regexp).nil?
      errors.add(:url, "invalid")
    end
  end

  private

  def generate_number
    self.number = Sequence.nextval_for(self.class.to_s)
  end
end

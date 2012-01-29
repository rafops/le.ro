class Sequence
  def self.nextval_for sequence_name
    collection = MongoMapper.database.collection 'sequences'
    sequence = collection.find({ _id: sequence_name }).first
    collection.insert({ _id: sequence_name, value: 0 }) if sequence.nil?
    sequence = collection.find_and_modify({ query: { _id: sequence_name }, update: { '$inc' => { 'value' => 1 } }, new: true })
    sequence['value'] unless sequence.nil?
  end
end

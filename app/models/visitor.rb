class Visitor
  include MongoMapper::Document

  key :number, Integer, required: true
  key :remote_addr, String, required: true
  key :request_path, String, required: true
  key :http_user_agent, String
  timestamps!
end

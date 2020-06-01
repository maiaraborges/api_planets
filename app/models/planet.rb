class Planet
  include Mongoid::Document
  field :name, type: String
  field :climate, type: String
  field :terrain, type: String
  validates :name, presence: true
  attr_accessor :films
end

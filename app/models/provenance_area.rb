class ProvenanceArea < ActiveRecord::Base
  has_many :person_address

  attr_accessible :description
end

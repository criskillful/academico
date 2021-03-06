class DeptTelephone < ActiveRecord::Base
  belongs_to :telephone_type
  belongs_to :dept
  attr_accessible :area_code, :branch, :number, :dept_id, :telephone_type_id
  
  validates :telephone_type_id, :number, :area_code, :presence => true
  validates :number, :length => { :in => 8..9  }#, :message => "Número de telefone inválido. mínimo permitido: %{count}" }
 
end

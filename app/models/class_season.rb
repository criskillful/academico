class ClassSeason < ActiveRecord::Base
  belongs_to :class_season_type
  belongs_to :dept
  attr_accessible :end_at, :number, :start_at, :year, :class_season_type_id, :dept_id
  validates :end_at, :number, :start_at, :year, :class_season_type_id,  :dept_id, :presence => true
  validates :year, :length => {:is => 4}
  
  
 

  def model_custom_name
       self.year.to_s + '/' + self.number.to_s + " - #{self.class_season_type.try(:description)}"
  end
    
end

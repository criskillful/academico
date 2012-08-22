class DisciplineClass < ActiveRecord::Base
  belongs_to :school_class
  belongs_to :matrix_discipline
  attr_accessible :code, :ending_at, :started_at, :timetable_started_at, :vancancies, :school_class_id, :matrix_discipline_id
end

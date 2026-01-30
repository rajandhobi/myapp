class CreateCoursesDoctorsJoinTable < ActiveRecord::Migration[8.1]
  def change
    create_join_table :doctors, :courses do |t|
      # t.index [:doctor_id, :course_id]
      # t.index [:course_id, :doctor_id]
    end
  end
end


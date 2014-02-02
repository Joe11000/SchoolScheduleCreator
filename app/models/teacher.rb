class Teacher < ActiveRecord::Base
	attr_accessible :name, :bio

	validates :name, presence: true
  validates :bio,  presence: true

  belongs_to :school

  has_many :break_times, as: :timeable, class_name: "Timespan", dependent: :destroy
  has_many :teacher_course_possibilities
  has_many :courses_could_teach, # -> where('1 = 1'),
                                 through:     :teacher_course_possibilities,
                                 source:      :courses_pool,
                                 dependent:   :destroy
                                 # foreign_key: "teacher_course_possibility_id",

  def courses_teaching
     CoursesPool.joins(teacher_course_possibilities: :teacher).where("teacher_course_possibilities.scheduled_course = :tf 
                                                                      AND teachers.id = :id", { tf: true, id: id })
  end 


  def add_class_to_teach(class_id = 1)
    t =  TeacherCoursePossibility.joins(:teacher, :courses_pool).where("teachers.id = #{id} AND courses_pools.id = #{class_id}")
   
    if t.empty?
      "Teacher isn't able to teach this class"
  
    elsif t.first.scheduled_course 
      "Teacher #{name} is already teaching this course"

    else
       t.first.update_attributes(scheduled_course: true) 
      'Accepted'
    end
  end

  def add_class_could_teach
  #   courses_poolTeacherCoursePossibility
  end


  def available?(start_datetime, end_datetime)
    rand(2) == 1 ? "yes" : "no"
  end

  def next_available?
    [Time.now, 74]  # returns next available time and how long much longer they are available for
  end
end

  # has_many :published_posts, -> { where published: true }, class_name: 'Post'

  # scope :courses_could_teach { Teacher.join(:teacher_course_possibilities: :course).where('teachers.id = self.id ') }

  # scope :courses_teaching, joins(:teacher_course_possibility).where("self.teacher_course_possibilities.scheduled_course = ?",true) 
  # scope :courses_teaching, joins("INNER JOIN teacher_course_possibilities 
  #                                 ON teacher_course_possibilities.teacher_id = teacher.id
  #                                 WHERE scheduled_course = true ")  
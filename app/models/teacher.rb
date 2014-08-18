class Teacher < ActiveRecord::Base
	attr_accessible :name, :bio

	validates :name, presence: true
  validates :bio,  presence: true

  belongs_to :school

  has_many :break_times, as: :timeable,
                         class_name: "Timespan",
                         dependent: :destroy

  #  tcr = teacher_course_room
  has_many :courses_pools, through: :tcr_possibilities


  has_many :tcr_possibilities, inverse_of: :teacher,
                                          dependent:  :destroy


  has_many :courses_could_teach, through: :tcr_possibilities,
                                 source:  :courses_pool

  has_many :courses_teaching, -> { where('tcr_possibilities.scheduled_course = ? ', true) },
                                 through: :tcr_possibilities,
                                 source:  :courses_pool


  def add_course_to_teach(course_id = 1)
    t =  TeacherCoursePossibility.joins(:teacher, :courses_pool).where("teachers.id = #{id} AND courses_pools.id = #{course_id}")

    if t.empty?
      "Teacher isn't able to teach this course"

    elsif t.first.scheduled_course
      "Teacher #{name} is already teaching this course"

    else
       t.first.update_attributes(scheduled_course: true)
      'Accepted'
    end
  end

  # def add_course_could_teach(course_id_that_exists)
  #    courses_pools << CoursePoolscourse_id_that_exists
  # end


  def available_at_time?(start_datetime, end_datetime)
    rand(2) == 1 ? "yes" : "no"
  end

  def next_available_time?
    [Time.now, 74]  # returns next available time and how long much longer they are available for
  end
end

  # has_many :published_posts, -> { where published: true }, class_name: 'Post'

  # scope :courses_could_teach { Teacher.join(:tcr_possibilities: :course).where('teachers.id = self.id ') }

  # scope :courses_teaching, joins(:tcr_possibility).where("self.tcr_possibilities.scheduled_course = ?",true)
  # scope :courses_teaching, joins("INNER JOIN tcr_possibilities
  #                                 ON tcr_possibilities.teacher_id = teacher.id
  #                                 WHERE scheduled_course = true ")

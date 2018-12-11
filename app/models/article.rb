class Article < ActiveRecord::Base
  #
  # def initialize(attributes)
  #   @id = attributes.fetch(:id, 0)
  #   @link = attributes.fetch(:link, )
  # end

  belongs_to :user
  has_many :comments
  # validates :user_id, :presence => true
  validates :link, :presence => true
  validates :title, :presence => true
  validates :points, :presence => true
  #
  # def add_points(points = 1)
  #   @points += points
  #   update({:points => @points})
  #   @points
  # end
end

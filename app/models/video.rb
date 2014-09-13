class Video < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  # validates :name, :presence => true
  # validates :youtube_id, :presence => true
  # validates :description, :presence => true
end

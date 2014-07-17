# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  completed  :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
	belongs_to :user
	has_many :tasklings
	has_many :users, through: :tasklings
	validates_presence_of :name
end

# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :subscriptions
  has_many :users, through: :subscriptions

  def create_tasklings_for(user)
  	self.tasks.each do |task|
  		Taskling.create(user: user, task: task, status: 1)
  	end
  end

end

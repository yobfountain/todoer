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
  after_create :generate_code

  def create_tasklings_for(user)
  	self.tasks.each do |task|
  		Taskling.create(user: user, task: task, status: 1)
  	end
  end

  def generate_code
    code = SecureRandom.urlsafe_base64(6)
    while List.exists?(code: code) do
      code = SecureRandom.urlsafe_base64(6)
    end
    
    update code: code
  end

end

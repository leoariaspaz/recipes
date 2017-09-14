class Project < ApplicationRecord
	has_many :tasks, :class_name => "Task", dependent: :destroy
	validates_presence_of :name, :on => :create, :message => "can't be blank"
	validates_associated :tasks

	after_update :save_tasks

	def new_task_attributes=(task_attributes)
		task_attributes.each do |attributes|
			tasks.build(attributes)
		end
	end

	def existing_task_attributes=(task_attributes)
		tasks.reject(&:new_record?).each do |task|
			attributes = task_attributes[task.id.to_s]
			if attributes
				task.attributes = attributes
			else
				tasks.delete(task)
			end
		end
	end

	def save_tasks
		tasks.each do |t|
			t.save(validate: false)
		end
	end
end

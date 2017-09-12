class Project < ApplicationRecord
	has_many :tasks, :class_name => "task", :foreign_key => "reference_id"
	validates_presence_of :name, :on => :create, :message => "can't be blank"
end

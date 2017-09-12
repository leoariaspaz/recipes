class Task < ApplicationRecord
  belongs_to :project
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end

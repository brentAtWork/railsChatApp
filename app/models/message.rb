class Message < ActiveRecord::Base
  belongs_to :interaction, polymorphic: true
  belongs_to :user

  validates_presence_of :body, :interaction_id, :user_id
end

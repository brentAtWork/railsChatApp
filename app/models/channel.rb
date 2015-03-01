class Channel < ActiveRecord::Base
	belongs_to :creator, :foreign_key => :creator_id, class_name: 'User'

	has_many :messages, as: :interaction, dependent: :destroy

	validates :name,
		:presence => true,
		:uniqueness => {
			:case_sensitive => false
		}

end

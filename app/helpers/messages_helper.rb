module MessagesHelper
	def self_or_other(message)
		message.user == current_user ? "self" : "other"
	end

	def message_interlocutor(message)
		message.user == message.interaction.sender ? message.interaction.sender : message.interaction.recipient
	end

end

class MessagesController < ApplicationController
	before_filter :authenticate_user!

	def create
		message = params[:message]
		puts ("<---------------Interaction type: #{message[:interaction_type]}-------------->")
		@interaction = message[:interaction_type] == "conversation" ? Conversation.find(params[:conversation_id]) : Channel.find(params[:channel_id])
		@message = @interaction.messages.build(message_params)
		@message.user_id = current_user.id
		@message.save!

		@path = message[:interaction_type] == "conversation" ? conversation_path(@interaction) : channel_path(@interaction)

	end

	private

	def message_params
		params.require(:message).permit(:body, :interaction_type)
	end
end

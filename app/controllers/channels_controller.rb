class ChannelsController < ApplicationController
	before_filter :authenticate_user!

	layout :resolve_layout

	def resolve_layout
		if action_name == "show"
			false
		else
			"application"
		end
	end

	def new
		@channel = Channel.new
	end

	def create
		@channel = Channel.new()
		@channelParams = params[:channel]
		@channel.name = @channelParams[:name]

		@channel.creator_id = current_user.id

		respond_to do |format|
			if @channel.save
				format.html { redirect_to root_path, notice: 'Channel was successfully created.' }
				format.json { render json: @channel}
			else
				format.html { render :new }
				format.json { render json: @channel.errors, status: :unprocessable_entity}
			end
		end
	end

	def show
		@channel = Channel.find(params[:id])
		@messages = @channel.messages.order(created_at: :asc)
		@message = Message.new
	end

	private
	def channel_params
		params.permit(:channel_id, :name)
	end
end

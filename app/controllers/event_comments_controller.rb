class EventCommentsController < ApplicationController

	#before_action :find_event
	#before_action :find_comment, only: [:edit, :update, :destroy]
	def create
		
		@comment = @event.event_comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to events_path(@event)
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @comment.update(comment_params)
			redirect_to events_path(@event)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to events_path(@event)
	end
	private

		def comment_params
			params.require(:event_comments).permit(:content)
		end

	def find_event
		@event = Event.find(params[:event_id])
	end

	def find_comment
		@comment = @event.event_comments.find(params[:id])
	end	


end

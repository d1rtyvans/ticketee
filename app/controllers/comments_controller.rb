class CommentsController < ApplicationController
  before_action :set_ticket

  def create
    @comment = @ticket.comments.build(sanitized_parameters)
    @comment.author = current_user
    authorize @comment, :create?

    if @comment.save
      redirect_to [@ticket.project, @ticket], notice: "Comment has been created."
    else
      flash.now[:alert] = "Comment has not been created."
      @project = @ticket.project
      render "tickets/show"
    end
  end

  private

    def set_ticket
      @ticket = Ticket.find(params[:ticket_id])
    end

    def comment_params
      params.require(:comment).permit(:text, :state_id, :tag_names)
    end

    def sanitized_parameters
      whitelisted_params = comment_params
      whitelisted_params.delete(:state_id) unless policy(@ticket).change_state?
      whitelisted_params.delete(:tag_names) unless policy(@ticket).tag?
      whitelisted_params
    end
end

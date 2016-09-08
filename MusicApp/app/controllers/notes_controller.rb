class NotesController < ApplicationController
  before_action :require_user

  def create
    note = Note.new(text: params[:note][:text])
    note.user_id = current_user.id
    note.track_id = params[:track_id]
    unless note.save
      flash[:errors] = @note.errors.full_messages
    end
    redirect_to track_url(note.track_id)

  end

  def destroy
    note = Note.find(params[:id])
    if note.user == current_user
      note.destroy
      redirect_to track_url(note.track_id)
    else
      render text: "BAD", status: :forbidden
    end
  end
end

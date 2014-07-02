class NotesController < ApplicationController

  def create
    note = Note.create(note_params)
    current_user.notes << note
    redirect_to user_path(current_user)
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:message)
  end

end

class NotesController < ApplicationController
  def create
    # @problem = Problem.find(params[:problem_id])
    @note = Note.new(note_params)
    if @note.save
      redirect_to problem_path(@note.problem_id), notice: "Note saved successfully"
    else
      redirect_to problem_path(@note.problem_id), notice: "Invalid note input"
    end
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :problem_id, :text )
  end
end

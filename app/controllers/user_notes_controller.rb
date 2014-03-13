class UserNotesController < ApplicationController

  before_filter :set_user_note, except: [:index]

  def index
    @user_notes = current_user.user_notes
  end

  def show
    render :edit
  end

  def edit
  end

  def update
    if @user_note.update_attributes(user_notes_param)
      flash.notice = "Saved!"
    end

    respond_to do |format|
      format.html { redirect_to(edit_user_note_path(@user_note)) }
      format.js
    end
  end

  private

  def set_user_note
    @user_note = current_user.user_notes.first || current_user.user_notes.new.save!
  end

  def user_notes_param
    params.require(:user_note).permit(:notes)
  end
end

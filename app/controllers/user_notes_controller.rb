class UserNotesController < ApplicationController

  before_filter :set_user_note, except: [:index, :new, :create]

  def index
    @user_notes = current_user.user_notes
  end

  def create
    service = UserNotesService.new(current_user)
    @user_note = service.create_note_from(params[:new_note])
    @user_notes = service.all_notes
    respond_to do |format|
      format.html { redirect_to(user_notes_url) }
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to(user_notes_url) }
      format.js
    end
  end

  def update
    @user_note.update_attribute('notes', params[:text]) if @user_note.notes != params[:text]

    respond_to do |format|
      format.html { redirect_to(edit_user_note_path(@user_note)) }
      format.js
    end
  end

  def destroy
    @user_notes = current_user.user_notes
    @user_note.destroy
    respond_to do |format|
      format.html { redirect_to(user_notes_url) }
      format.js
    end
  end


  private

  def set_user_note
    #@user_note = current_user.user_notes.first || current_user.user_notes.new
    @user_note = UserNote.find(params[:id])
  end

end

class UserNotesController < ApplicationController

  before_filter :set_user_note, except: [:index, :new, :create]

  def index
    @user_notes = current_user.user_notes
  end

  def create
    @user_notes = current_user.user_notes
    #HACK ALERT: prevent from creating multiple within the same second for the user
    if (new_note = params[:new_note]).present?  && @user_notes.last.created_at < 1.second.ago
      @user_note = current_user.user_notes.build(:notes => new_note)
      current_user.save!
    end
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

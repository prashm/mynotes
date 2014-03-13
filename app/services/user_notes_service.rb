class UserNotesService

  attr_reader :all_notes

  def initialize(user)
    @user = user
    @all_notes = @user.user_notes if @user
  end

  def create_note_from(text)
    user_notes = @user.user_notes
    #HACK ALERT: prevent from creating multiple within the same second for the user
    ok_to_proceed = @all_notes.last.present? ? @all_notes.last.created_at < 1.second.ago : true
    if text.present?  && ok_to_proceed
      user_note = @all_notes.build(:notes => text)
      @user.save!
    end
    return user_note
  end
end
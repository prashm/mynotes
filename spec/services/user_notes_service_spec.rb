require 'spec_helper'

describe UserNotesService do
  before do
    @user = User.new(uname: "test", password: "test", password_confirmation: "test")
    @user.save
  end

  describe "#create_note_from" do
    it "should create a user note" do
      expect {
        user_note = UserNotesService.new(@user).create_note_from("hey")
        user_note.should == @user.reload.user_notes.last
        user_note.notes.should == "hey"
      }.to change { UserNote.count }.by(1)
    end

    it "should not create for an empty user note" do
      UserNotesService.new(@user).create_note_from("")
      UserNote.last.should be_nil
    end
  end
end

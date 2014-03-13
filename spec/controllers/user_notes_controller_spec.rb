require 'spec_helper'

describe UserNotesController do
  context "GET edit" do
    it "should redirect to sign-in page when authentication fails" do
      get :edit, {id:1}
      response.should redirect_to(log_in_path)
    end
  end

  context "POST create" do
    before do
      u = double(User)
      u.stub(:user_notes).and_return([])
      User.stub(:find_by_id).and_return(u)
      UserNotesService.any_instance.stub(:all_notes).and_return(["abc"])
      UserNotesService.any_instance.stub(:create_note_from).and_return("abc")
    end
    it "should assign users and user_note variables" do
      post :create, {new_note: "123"}
      assigns(:user_note).should_not be_nil
      assigns(:user_notes).should_not be_nil
    end
  end
end

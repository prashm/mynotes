require 'spec_helper'

describe UserNotesController do
  context "GET edit" do
    it "should redirect to sign-in page when authentication fails" do
      get :edit
      response.should redirect_to(log_in_path)
    end
  end
end

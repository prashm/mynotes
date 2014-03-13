require 'spec_helper'

describe SessionsController do
  context "POST create" do
    it "should set user session on success" do
      u = double(User)
      u.stub(:id).and_return(1)
      User.stub(:authenticate).and_return(u)
      post :create
      session[:user_id].should == 1
    end

    it "should redirect to root on success" do
      u = double(User)
      u.stub(:id).and_return(1)
      User.stub(:authenticate).and_return(u)
      post :create
      response.should redirect_to(root_url)
    end

    it "should render new on fail" do
      User.stub(:authenticate).and_return(nil)
      post :create
      response.should render_template(:new)
    end
  end
end

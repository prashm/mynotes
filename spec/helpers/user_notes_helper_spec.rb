require 'spec_helper'

describe UserNotesHelper do

  describe "#format_friendly_time" do
    before do
      Time.stub(:now).and_return(Time.parse("2012-04-01 14:00"))
    end

    it "should say Today for today's date" do
      format_friendly_time(Time.parse("2012-04-01 09:30")).should == "Today at 09:30AM"
    end

    it "should say Yesterday for yesterday's date" do
      format_friendly_time(Time.parse("2012-03-31 21:30")).should == "Yesterday at 09:30PM"
    end

    it "should have Month and day for dates that are more than 2 days old" do
      format_friendly_time(Time.parse("2012-03-30 21:30")).should == "Mar 30 at 09:30PM"
    end

    it "should include year for dates past this year" do
      format_friendly_time(Time.parse("2011-12-25 18:00")).should == "Dec 25 2011 at 06:00PM"
    end
  end


end
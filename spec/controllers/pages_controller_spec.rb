require 'spec_helper'

describe PagesController do

  describe "GET 'work'" do
    it "returns http success" do
      get 'work'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end

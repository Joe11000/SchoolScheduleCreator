require 'spec_helper'

describe RoomController do

  describe "GET 'add_rooms'" do
    it "returns http success" do
      get 'add_rooms'
      response.should be_success
    end
  end

end

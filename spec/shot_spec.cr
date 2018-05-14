require "./spec_helper"

describe SHOT::Router do
  it "It should respond to get requests" do
    response = HTTP::Client.get "http://localhost:5000/hello"
    response.status_code.should eq 200 
    response.body.lines.first.should eq "Hello world!"
  end

  it "It should respond to post requests" do
    response = HTTP::Client.post "http://localhost:5000/comment"
    response.status_code.should eq 201
  end
end
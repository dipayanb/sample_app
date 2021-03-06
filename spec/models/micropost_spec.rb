require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }
  before do
    #@micropost = Micropost.new(content: "Lorem Ipsum", user_id: user.id)
    @micropost = user.microposts.build(content: "Lorem Ipsum")
  end

  subject { @micropost }

  it { should respond_to(:content)}
  it { should respond_to(:user_id)}
  it { should respond_to(:user)}
  its(:user) { should eq user }

  it { should be_valid }


  describe "when user id is not present " do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "When blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "When content is too long" do
    before { @micropost.content = 'a' * 141 }
    it { should_not be_valid }
  end

end
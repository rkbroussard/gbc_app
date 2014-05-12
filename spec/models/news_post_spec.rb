require 'spec_helper'

describe NewsPost do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @news_post = user.news_posts.build(content: "Lorem ipsum") }

  subject { @news_post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @news_post.user_id = nil }
  	it { should_not be_valid }
  end
end

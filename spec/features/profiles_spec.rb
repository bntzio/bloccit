require 'rails_helper'

describe "Visiting profiles" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    @comment = @user.comments.build(post: @post, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save
  end

  describe "not signed in" do 
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end
  end

  describe "signed in" do 
    before do 
      @user = create(:user)
      @post = create(:post, user: @user)
      @comment = @user.comments.build(post: @post, body: "A Comment")
      allow(@comment).to receive(:send_favorite_emails)
      login_as(@user, :scope => :user)
    end

    it "shows own profile" do 
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end
  end
end
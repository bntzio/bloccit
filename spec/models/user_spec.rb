require 'rails_helper'
 
 describe User do
 
   include TestFactories

   before do
    @post = associated_post
    @another_post = other_post
   end
 
   describe "#favorited(post)" do
     it "returns `nil` if the user has not favorited the post" do
      expect( @post.user.favorited(@post) ).to eq(nil)
     end
 
     it "returns the appropriate favorite if it exists" do
      # first solution
      @post.user.favorited(@post)

      # second solution
      # expect( @post.user.favorited(@post) ).to eq(@post.user.favorited(@post))
     end

     it "returns `nil` if the user has favorited anoter post" do
      expect( @post.user.favorited(@another_post) ).to eq(nil)
     end
   end
 end
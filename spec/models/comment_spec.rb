require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create!(name: 'user 1', posts_counter: 0)
  post = Post.create!(title: 'Post 1', author_id: user.id, comments_counter: 0, likes_counter: 0)
  subject { Comment.new(author_id: user.id, post_id: post.id, text: 'Hello world') }

  before { subject.save }

  it 'new comment should be saved in the database' do
    expect(subject.new_record?).to be_falsy
  end

  it 'posts comments count should increase' do
    expect(subject.post.comments_counter).to eq(post.comments_counter)
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with a name' do
    user = User.new(name: 'Hamid', posts_counter: 12)
    expect(user).to be_valid
  end

  it 'The counter should not be negative' do
    user = User.new
    user.name = 'Hamid'
    user.posts_counter = -1
    expect(user).to_not(be_valid)
  end
end

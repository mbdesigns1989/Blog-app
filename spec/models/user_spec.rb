require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing User Validations' do
    subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

    before { subject.save }

    it 'Name should be valid if it is Tom' do
      expect(subject).to be_valid
    end

    it 'Name should not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "Name should not be ''" do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'Post Counter should be a number >= 0' do
      expect(subject).to be_valid
    end

    it 'Post Counter should not be a number < 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Post Counter should not be a nil' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'Post Counter should be a number' do
      subject.posts_counter = 'a'
      expect(subject).to_not be_valid
    end
  end
end

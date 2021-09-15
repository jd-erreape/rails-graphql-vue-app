# frozen_string_literal: true

RSpec.shared_examples 'a Likeable model' do |entity|
  describe 'shoulda matchers' do
    subject { create(entity) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:post) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to(:post_id) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end

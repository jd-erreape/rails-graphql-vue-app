# frozen_string_literal: true

RSpec.shared_examples 'a likeable creation entity' do |to_delete, to_create|
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:instance) { described_class.new(user: user, post: post) }

  describe '#run' do
    subject { instance.run }

    context "when there is a #{to_delete} for the user and post" do
      let!(to_delete.to_sym) { create(to_delete.to_sym, user: user, post: post) }
      let(to_create.to_sym) { to_create.capitalize.constantize.find_by(user: user, post: post) }

      before { subject }

      it "deletes the #{to_delete}" do
        expect { send(to_delete).reload }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it "creates the #{to_create}" do
        expect(subject).to be_persisted
      end

      it "assigns the #{to_create} to the proper user" do
        expect(subject.user).to eq(user)
      end

      it "assigns the #{to_create} to the proper post" do
        expect(subject.post).to eq(post)
      end
    end
  end
end

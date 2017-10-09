require 'rails_helper'

describe AuthUser do
  describe 'in general' do
    subject { described_class.new(omni_auth_hash) }

    context 'with a valid omni_auth hash' do
      let(:omni_auth_hash) { valid_omnni_auth_user }

      it 'sets the email address' do
        expect(subject.email).to eq('alice@example.com')
      end

      it 'sets the name' do
        expect(subject.name).to eq('Alice Arnold')
      end
    end

    context 'with an invalid omni_auth hash' do
      let(:omni_auth_hash) { { name: 'bob' } }

      it 'fails gracefully' do
        expect(subject.email).to be_nil
      end
    end
  end
end

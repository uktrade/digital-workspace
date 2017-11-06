require 'rails_helper'

describe AuthUser do
  describe '#from_omniauth_hash' do
    subject { described_class.from_omniauth_hash(omniauth_hash) }

    context 'with a valid omniauth hash' do
      let(:omniauth_hash) { valid_omnniauth_user }

      it 'sets the email address' do
        expect(subject.email).to eq('alice@example.com')
      end
    end

    context 'with an invalid omniauth hash' do
      let(:omniauth_hash) { { name: 'bob' } }

      it 'fails gracefully' do
        expect(subject.email).to be_nil
      end
    end
  end
end

require 'rails_helper'

describe PeopleFinderProfile do
  describe '#from_api' do
    let(:user) { AuthUser.new(email: 'alice@example.com') }

    subject { described_class.from_api(user) }

    context 'for a successful request' do
      before do
        response = double(:response, body: people_finder_hash, success?: true)

        allow(Typhoeus)
          .to receive(:get)
          .and_return(response)
      end

      context 'with an existing people finder profile' do
        let(:people_finder_hash) { existing_user_json }

        it { is_expected.to be_present }

        it 'assigns the name' do
          expect(subject.name).to eq('Alice Arnold')
        end

        it 'assigns the team' do
          expect(subject.team).to eq('Scientists')
        end

        it 'assigns the completion_score' do
          expect(subject.completion_score).to eq(12)
        end

        it 'assigns the profile_image_url' do
          expect(subject.profile_image_url).to eq('alice-image-url')
        end

        it 'assigns the profile_url' do
          expect(subject.profile_url)
            .to eq("#{ENV['PEOPLEFINDER_URL']}/my/profile")
        end

        context 'when the parameter is an email address' do
          let(:user) { 'alice@example.com' }

          it 'assigns the name' do
            expect(subject.name).to eq('Alice Arnold')
          end
        end
      end

      context 'when that person is not found in peoplefinder' do
        let(:people_finder_hash) { user_not_found }

        it { is_expected.to_not be_present }

        it 'does not assign the name' do
          expect(subject.name).to be_blank
        end

        it 'does not assign the team' do
          expect(subject.team).to be_blank
        end

        it 'assigns the completion_score to zero' do
          expect(subject.completion_score).to eq(0)
        end

        it 'does not assign the profile_image_url' do
          expect(subject.profile_image_url).to be_blank
        end

        it 'assigns the profile_url to the peoplefinder URL' do
          expect(subject.profile_url)
            .to eq("#{ENV['PEOPLEFINDER_URL']}/my/profile")
        end
      end
    end

    context 'when the People Finder does not return a response' do
      let(:response) { double('Response', success?: false, body: 'Internal server error') }

      before do
        allow(Typhoeus)
          .to receive(:get)
          .and_return(response)
      end

      it 'does not assign the name' do
        expect(subject.name).to be_blank
      end
    end
  end
end

def existing_user_json # rubocop:disable Metrics/MethodLength
  {
    data: {
      id: 1,
      type: 'people',
      attributes: {
        email: 'alice@example.com',
        name: 'Alice Arnold',
        'given-name': 'Alice',
        team: 'Scientists',
        'completion-score' => 12
      },
      links: {
        profile: 'alice-profile-url',
        'profile-image-url' => 'alice-image-url'
      }
    }
  }.to_json
end

def user_not_found
  {
    error: 'That person was not found'
  }.to_json
end

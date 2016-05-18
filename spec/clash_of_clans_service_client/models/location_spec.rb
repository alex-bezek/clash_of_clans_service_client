require 'spec_helper'

describe ClashOfClansServiceClient::Models::Location do
  before do
    stub_api_for(ClashOfClansServiceClient::Models::Location) do |stub|
      stub.get('/locations') {[200, {}, @locations_index.to_json]}
    end
  end

  let(:location) { described_class.all.first }

  describe '.all' do
    subject(:region) { described_class.all.first }
    subject(:country) { described_class.all[1] }

    describe 'attribtes' do
      it 'has a id' do
        expect(region.id).to_not be_nil
        expect(country.id).to_not be_nil
      end

      it 'has a name' do
        expect(region.name).to_not be_nil
        expect(country.name).to_not be_nil
      end

      it 'has country?' do
        expect(region.country?).to eq(false)
        expect(country.country?).to eq(true)
      end

      it 'has country_code' do
        expect(region.country_code).to be_nil
        expect(country.country_code).to_not be_nil
      end
    end
  end

  describe '#player_rankings' do
    before do
      stub_api_for(ClashOfClansServiceClient::Models::PlayerRanking) do |stub|
        stub.get("/locations/#{location.id}/rankings/players") {[200, {}, @player_rankings.to_json]}
      end
    end

    subject { location.player_rankings.first }

    it 'has tag' do
      expect(subject.tag).to_not be_nil
    end

    it 'has name' do
      expect(subject.name).to_not be_nil
    end

    it 'has exp_level' do
      expect(subject.exp_level).to_not be_nil
    end

    it 'has tropies' do
      expect(subject.trophies).to_not be_nil
    end

    it 'has attack_wins' do
      expect(subject.attack_wins).to_not be_nil
    end

    it 'has rank' do
      expect(subject.rank).to_not be_nil
    end

    it 'has previous_rank' do
      expect(subject.previous_rank).to_not be_nil
    end

    describe 'clan' do
      it 'has clan' do
        expect(subject.clan).to_not be_nil
      end

      it 'has tag' do
        expect(subject.clan.tag).to_not be_nil
      end

      it 'has name' do
        expect(subject.clan.name).to_not be_nil
      end

      describe 'bade_urls' do
        it 'has badge_urls' do
          expect(subject.clan.badge_urls).to_not be_nil
        end

        it 'has small' do
          expect(subject.clan.badge_urls.small).to_not be_nil
        end

        it 'has large' do
          expect(subject.clan.badge_urls.large).to_not be_nil
        end

        it 'has medium' do
          expect(subject.clan.badge_urls.medium).to_not be_nil
        end
      end
    end
  end

  describe 'clan_rankings' do
    before do
      stub_api_for(ClashOfClansServiceClient::Models::ClanRanking) do |stub|
        stub.get("/locations/#{location.id}/rankings/clans") {[200, {}, @clan_rankings.to_json]}
      end
    end

    subject { location.clan_rankings.first }

    it 'has tag' do
      expect(subject.tag).to_not be_nil
    end

    it 'has name' do
      expect(subject.name).to_not be_nil
    end

    describe 'location' do
      it 'has location' do
        expect(subject.location).to_not be_nil
      end

      it 'has id' do
        expect(subject.location.id).to_not be_nil
      end

      it 'has name' do
        expect(subject.location.name).to_not be_nil
      end

      it 'has country?' do
        expect(subject.location.country?).to_not be_nil
      end

      it 'has country_code' do
        expect(subject.location.country_code).to_not be_nil
      end
    end

    it 'has clan_level' do
      expect(subject.clan_level).to_not be_nil
    end

    it 'has members' do
      expect(subject.members).to_not be_nil
    end

    it 'has clan_points' do
      expect(subject.clan_points).to_not be_nil
    end

    it 'has rank' do
      expect(subject.rank).to_not be_nil
    end

    it 'has previous_rank' do
      expect(subject.previous_rank).to_not be_nil
    end

    describe 'bade_urls' do
      it 'has badge_urls' do
        expect(subject.badge_urls).to_not be_nil
      end

      it 'has small' do
        expect(subject.badge_urls.small).to_not be_nil
      end

      it 'has large' do
        expect(subject.badge_urls.large).to_not be_nil
      end

      it 'has medium' do
        expect(subject.badge_urls.medium).to_not be_nil
      end
    end
  end
end

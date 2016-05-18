require 'spec_helper'

describe ClashOfClansServiceClient::Models::Clan do

  describe '.where' do
    before do
      stub_api_for(ClashOfClansServiceClient::Models::Clan) do |stub|
        stub.get('/clans?locationid=32000056') {[200, {}, @clans_index.to_json]}
      end
    end

    subject { described_class.where(locationid: 32000056).first }

    it 'has tag' do
      expect(subject.tag).to_not be_nil
    end

    it 'has name' do
      expect(subject.name).to_not be_nil
    end

    it 'has type' do
      expect(subject.type).to_not be_nil
    end

    it 'has war_frequency' do
      expect(subject.war_frequency).to_not be_nil
    end

    it 'has clan_level' do
      expect(subject.clan_level).to_not be_nil
    end

    it 'has war_wins' do
      expect(subject.war_wins).to_not be_nil
    end

    it 'has war_win_streak' do
      expect(subject.war_win_streak).to_not be_nil
    end

    it 'has clan_points' do
      expect(subject.clan_points).to_not be_nil
    end

    it 'has required_trophies' do
      expect(subject.required_trophies).to_not be_nil
    end

    it 'has members' do
      expect(subject.members).to_not be_nil
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

    describe 'badge_urls' do
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

  describe '.find' do
    before do
      stub_api_for(ClashOfClansServiceClient::Models::Clan) do |stub|
        stub.get('/clans/%2523L8VU0VR9') {[200, {}, @clans_show.to_json]}
      end
    end

    subject { described_class.find('%23L8VU0VR9') }
    it 'has tag' do
      expect(subject.tag).to_not be_nil
    end

    it 'has name' do
      expect(subject.name).to_not be_nil
    end

    it 'has type' do
      expect(subject.type).to_not be_nil
    end

    it 'has war_frequency' do
      expect(subject.war_frequency).to_not be_nil
    end

    it 'has clan_level' do
      expect(subject.clan_level).to_not be_nil
    end

    it 'has war_wins' do
      expect(subject.war_wins).to_not be_nil
    end

    it 'has war_win_streak' do
      expect(subject.war_win_streak).to_not be_nil
    end

    it 'has clan_points' do
      expect(subject.clan_points).to_not be_nil
    end

    it 'has required_trophies' do
      expect(subject.required_trophies).to_not be_nil
    end

    it 'has members' do
      expect(subject.members).to_not be_nil
    end

    describe 'member_list' do
      it 'has member_list' do
        expect(subject.member_list).to_not be_nil
      end

      it 'has tag' do
        expect(subject.member_list.first.tag).to_not be_nil
      end

      it 'has name' do
        expect(subject.member_list.first.name).to_not be_nil
      end

      it 'has role' do
        expect(subject.member_list.first.role).to_not be_nil
      end

      it 'has exp_level' do
        expect(subject.member_list.first.exp_level).to_not be_nil
      end

      describe 'league' do
        it 'has league' do
          expect(subject.member_list.first.league).to_not be_nil
        end

        it 'has id' do
          expect(subject.member_list.first.league.id).to_not be_nil
        end

        it 'has name' do
          expect(subject.member_list.first.league.name).to_not be_nil
        end

        it 'has icon_urls' do
          expect(subject.member_list.first.league.icon_urls).to_not be_nil
        end

        it 'has small' do
          expect(subject.member_list.first.league.small).to_not be_nil
        end

        it 'has tiny' do
          expect(subject.member_list.first.league.tiny).to_not be_nil
        end
      end

      it 'has trohpies' do
        expect(subject.member_list.first.trophies).to_not be_nil
      end

      it 'has clan_rank' do
        expect(subject.member_list.first.clan_rank).to_not be_nil
      end

      it 'has previous_clan_rank' do
        expect(subject.member_list.first.previous_clan_rank).to_not be_nil
      end

      it 'has donations' do
        expect(subject.member_list.first.donations).to_not be_nil
      end

      it 'has donations_recieved' do
        expect(subject.member_list.first.donations_recieved).to_not be_nil
      end


    end


  end
end

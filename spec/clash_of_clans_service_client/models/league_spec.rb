require 'spec_helper'

describe ClashOfClansServiceClient::Models::League do
  before do
    stub_api_for(ClashOfClansServiceClient::Models::League) do |stub|
      stub.get('/leagues') {[200, {}, @leagues_index.to_json]}
    end
  end

  describe '.all' do
    subject { described_class.all.first }

    describe 'attribtes' do
      it 'has a id' do
        expect(subject.id).to_not be_nil
      end

      it 'has a name' do
        expect(subject.name).to_not be_nil
      end

      describe 'icon_urls' do
        it 'has a icon_urls' do
          expect(subject.icon_urls).to_not be_nil
        end

        it 'has nested attribute small' do
          expect(subject.icon_urls.small).to_not be_nil
        end

        it 'has nested attribute tiny' do
          expect(subject.icon_urls.tiny).to_not be_nil
        end

        it 'has nested attribute medium' do
          expect(subject.icon_urls.medium).to_not be_nil
        end
      end
    end
  end

end

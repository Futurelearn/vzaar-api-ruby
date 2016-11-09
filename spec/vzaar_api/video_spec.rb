module VzaarApi
  describe Video do

    before do
      setup_auth!
    end

    describe '#initialize' do
      subject { described_class.new attrs }

      let(:attrs) do
        {
          id: 'id',
          title: 'title',
          user_id: 'user_id',
          account_id: 'account_id',
          description: 'description',
          private: 'private',
          seo_url: 'seo_url',
          url: 'url',
          thumbnail_url: 'thumbnail_url',
          state: 'state',
          renditions: renditions,
          created_at: 'created_at',
          updated_at: 'updated_at',
        }
      end

      let(:renditions) do
        [ { id: 'rendition-id' } ]
      end

      specify { expect(subject.id).to eq 'id' }
      specify { expect(subject.title).to eq 'title' }
      specify { expect(subject.user_id).to eq 'user_id' }
      specify { expect(subject.account_id).to eq 'account_id' }
      specify { expect(subject.description).to eq 'description' }
      specify { expect(subject.private).to eq 'private' }
      specify { expect(subject.seo_url).to eq 'seo_url' }
      specify { expect(subject.url).to eq 'url' }
      specify { expect(subject.thumbnail_url).to eq 'thumbnail_url' }
      specify { expect(subject.state).to eq 'state' }
      specify { expect(subject.renditions.first.id).to eq 'rendition-id' }
      specify { expect(subject.created_at).to eq 'created_at' }
      specify { expect(subject.updated_at).to eq 'updated_at' }
    end

    describe '.create' do
      context 'when we already have the guid' do
        let(:attrs) do
          { guid: 't8dec9434bcc64622b68d1dc16f3ddffap' }
        end

        context 'and a new video is created' do
          it 'returns the new video' do
            VCR.use_cassette('videos/create/guid_201') do
              video = described_class.create(attrs)
              expect(video.id).to eq 7574825
            end
          end
        end

        context 'and the video has already been created' do
          it 'raises an error' do
            VCR.use_cassette('videos/create/guid_error') do
              expect { described_class.create attrs }.to raise_error(
                Error, 'Invalid parameters: The provided guid already exists')
            end
          end
        end
      end

      context 'when we have a file path' do
        let(:attrs) do
          { path: 'spec/support/files/video-1.0MB.mp4', title: 'video' }
        end

        context 'and a new video is created' do
          it 'returns the new video' do
            VCR.use_cassette('videos/create/path_201') do
              video = described_class.create(attrs)
              expect(video.id).to eq 7574827
            end
          end
        end
      end

      context 'when we provide a url' do
        let(:attrs) do
          { url: 'http://example.com/video.mp4', uploader: UPLOADER }
        end

        context 'and a new video is created' do
          it 'returns the new video' do
            VCR.use_cassette('videos/create/link_201') do
              video = described_class.create(attrs)
              expect(video.id).to eq 7574826
            end
          end
        end

        context 'and invalid params are provided' do
          it 'raises an error' do
            VCR.use_cassette('videos/create/link_error') do
              attrs.delete :uploader
              expect { described_class.create attrs }.to raise_error(
                Error, 'Invalid parameters: uploader is missing')
            end
          end
        end
      end

      context 'when invalid params are provided' do
        it 'raises an error' do
          expect { described_class.create }.to raise_error(
            Error, 'Invalid parameters: Expected one of :guid, :path, :url')
        end
      end
    end

  end
end

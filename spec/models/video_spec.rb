require 'rails_helper'

RSpec.describe Video, type: :model do
  describe '動画追加の検証' do
    context '成功するとき' do
      it '全項目を入力の場合' do
        video = create(:video)
        expect(video).to be_valid
        expect(video.errors).to be_empty
      end

      it '未登録のYouTubeのIDを追加する場合' do
        create(:video)
        video_another_youtube_id = build(:video)
        expect(video_another_youtube_id).to be_valid
        expect(video_another_youtube_id.errors).to be_empty
      end
    end

    context '失敗するとき' do
      it 'YouTubeのIDのみ未入力の場合' do
        video_without_youtube_id = build(:video, youtube_id: '')
        expect(video_without_youtube_id).to be_invalid
        expect(video_without_youtube_id.errors.full_messages).to eq ["Youtube can't be blank"]
      end

      it '住所のみ未入力の場合' do
        video_without_address = build(:video, address: '')
        expect(video_without_address).to be_invalid
        expect(video_without_address.errors.full_messages).to eq ["Address can't be blank"]
      end

      it 'サウナ名のみ未入力の場合' do
        video_without_sauna = build(:video, sauna: '')
        expect(video_without_sauna).to be_invalid
        expect(video_without_sauna.errors.full_messages).to eq ["Sauna can't be blank"]
      end

      it '追加済みのYouTubeのIDを追加する場合' do
        video = create(:video)
        video_added_youtube_id = build(:video, youtube_id: video.youtube_id)
        expect(video_added_youtube_id).to be_invalid
        expect(video_added_youtube_id.errors.full_messages).to eq ['Youtube has already been taken']
      end
    end
  end
end

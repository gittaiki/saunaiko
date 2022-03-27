require 'rails_helper'

RSpec.describe 'Videos', type: :system do
  let(:video) { create(:video) }

  describe '動画詳細ページにアクセス' do
    before do
      visit video_path(video)
    end
    it '動画が詳細情報が表示される' do
      expect(page).to have_content video.sauna
      expect(current_path).to eq video_path(video)
    end
  end

  describe '動画一覧ページにアクセス' do
    before do
      visit videos_path
    end

    it '動画一覧が表示される' do
      expect(page).to have_content('動画一覧')
    end

    context '地名を検索フォームに入力' do
      before do
        fill_in 'q[sauna_or_address_cont]', with: video.address
        find('.search-btn').click
      end

      it '該当する動画が表示される' do
        expect(page).to have_content video.address
        expect(current_path).to eq videos_path
      end
    end

    context '施設名を検索フォームに入力' do
      before do
        fill_in 'q[sauna_or_address_cont]', with: video.sauna
        find('.search-btn').click
      end

      it '該当する動画が表示される' do
        expect(page).to have_content video.sauna
        expect(current_path).to eq videos_path
      end
    end

    context '該当しない文字を検索フォームに入力' do
      before do
        video
        fill_in 'q[sauna_or_address_cont]', with: 'あいうえお'
        find('.search-btn').click
      end

      it '動画が表示されない' do
        expect(page).to have_content('該当するサウナ動画は見つかりませんでした。')
        expect(current_path).to eq videos_path
      end
    end
  end
end

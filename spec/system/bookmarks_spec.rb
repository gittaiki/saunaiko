require 'rails_helper'

RSpec.describe 'Bookmarks', type: :system do
  let(:user) { create(:user) }
  let(:video) { create(:video) }

  describe 'ログイン後' do
    before do
      # sessionにUserIDを返し、ログインしたことにする
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
    end
    describe '動画詳細ページにアクセス' do
      before do
        visit video_path(video)
      end
      context '「ハート」ボタンを押す' do
        before do
          find('.fa-heart').click
        end
        it 'いいねページに動画が追加されている' do
          visit bookmarks_videos_path
          expect(page).to have_content video.sauna
        end
      end
    end

    describe '動画一覧ページにアクセス' do
      before do
        video
        visit videos_path
      end
      context '最初にある動画の「ハート」ボタンを押す' do
        before do
          page.first('.fa-heart').click
        end
        it 'いいねページに動画が追加されている' do
          visit bookmarks_videos_path
          expect(page).to have_content video.sauna
        end
      end
    end
  end
end

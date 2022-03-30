require 'rails_helper'

RSpec.describe "Watches", type: :system do
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
      context '「視聴済にする」ボタンを押す' do
        before do
          click_link '視聴済にする'
        end
        it '「視聴済」になり、チェックマークが付与されている' do
          expect(page).to have_css('.fa-circle-check')
        end
      end
    end
  end
end

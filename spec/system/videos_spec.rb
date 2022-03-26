require 'rails_helper'

RSpec.describe "Videos", type: :system do
  describe 'ログイン前' do
    context '動画一覧ページにアクセス' do
      it 'アクセスが成功する' do
        visit videos_path
        expect(page).to have_content('動画一覧')
      end
    end
  end
end

require 'rails_helper'

descirbe '投稿のテスト' do
  let!(:list) { create(:list, title: "hoge", body: "body") }
  
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面(top_path)に「ここはTopページです」が表示されているか' do
        expect(page).to have_content 'ここはTopページです'
      end
      it 'top_pathが"/top"であるか' do
        expect(current_path).to eq('/top')
      end
    end
  end
  
  describe '投稿画面のテスト'do
   before do
     visit new_list_path
   end
   context '表示の確認' do
     it 'new_list_pathが"/lists/new"であるか' do
        expect(current_path).to eq('/lists/new')
     end
     it '投稿ボタンが表示されているか' do
       expect(page).to have_button 'create'
     end
   end
   context '投稿処理のテスト' do
     it '投稿後のリダイレクト先は正しいか' do
       fill_in 'List[title]', with: Faker::Lorem.characters(number:10)
       fill_in 'List[body]', with: Faker::Lorem.characters(number:30)
       click_button 'create'
       expect(page).to have_current_path list_path(list)
     end
   end
  end
  
  describe '一覧画面のテスト' do
    
  end
end
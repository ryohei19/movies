# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Moveiモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { movie.valid? }

    let(:user) { create(:user) }
    let(:genre) { create(:genre) }
    let!(:movie) { build(:movie, genre_id: genre.id, user_id: user.id) }

  context 'nameカラム' do
      it '空欄でないこと' do
        movie.name = ''
        is_expected.to eq false
      end
    end

  context 'rateカラム' do
      it '空欄でないこと' do
        movie.rate = ''
        is_expected.to eq false
      end
    end

  context 'reviewカラム' do
      it '空欄でないこと' do
        movie.review = ''
        is_expected.to eq false
      end
    end

  context 'genre_idカラム' do
      it '空欄でないこと' do
        movie.genre_id = ''
        is_expected.to eq false
      end
    end
  end


  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Movie.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Genreモデルとの関係' do
      it 'N:1となっている' do
        expect(Movie.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
  end
end
require 'rails_helper'

RSpec.describe "Movies", type: :request do
  fixtures :movies

  let(:movie) { movies(:one) }
  let(:other) { movies(:two) }

  describe "GET / (index)" do
    it "returns success and renders the index" do
      get root_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('<table')
    end

    it "accepts sort params" do
      get root_path, params: { sort: 'title', direction: 'asc' }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /movies/:id" do
    it "shows a movie" do
      get movie_path(movie)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(movie.title)
    end
  end

  describe "GET new/edit" do
    it "renders new" do
      get new_movie_path
      expect(response).to have_http_status(:ok)
    end

    it "renders edit" do
      get edit_movie_path(movie)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /movies" do
    it "creates a movie" do
      expect {
        post movies_path, params: { movie: { title: 'RSpec Movie', rating: 'PG', description: 'x', release_date: '2020-01-01' } }
      }.to change(Movie, :count).by(1)
      expect(response).to redirect_to(movie_path(Movie.last))
    end

    it "creates a movie even without title (no validation)" do
      expect {
        post movies_path, params: { movie: { title: '', rating: 'PG', description: 'x', release_date: '2020-01-01' } }
      }.to change(Movie, :count).by(1)
      expect(response).to redirect_to(movie_path(Movie.last))
    end
  end

  describe "PATCH /movies/:id" do
    it "updates a movie" do
      patch movie_path(movie), params: { movie: { title: 'Updated via RSpec' } }
      expect(response).to redirect_to(movie_path(movie))
      movie.reload
      expect(movie.title).to eq('Updated via RSpec')
    end
  end

  describe "DELETE /movies/:id" do
    it "destroys a movie" do
      expect { delete movie_path(movie) }.to change(Movie, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end
  end
end

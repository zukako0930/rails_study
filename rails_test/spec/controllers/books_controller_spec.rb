require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    describe "DELETE #destroy" do
        it 'bookが削除される' do
            books = create_list(:book,2)
            expect{
                delete :destroy, id: books.first
            }.to change(Book, :count).by(-1)
        end
    end
end

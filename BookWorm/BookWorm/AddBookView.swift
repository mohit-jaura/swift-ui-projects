//
//  AddBookView.swift
//  BookWorm
//
//  Created by Mohit Soni on 21/11/23.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var showValidationAlert: Bool = false
    private func validateForm() -> Bool {
        var isValid = true
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isValid = false
        } else if author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isValid = false
        } else if genre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isValid = false
        } else if review.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isValid = false
        }
        return isValid
    }

    private func addBook() {
        let isValidForm: Bool = validateForm()
        if isValidForm {
            let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
            modelContext.insert(newBook)
            dismiss()
        } else {
            showValidationAlert = true
        }
    }

    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        // add the book
                        addBook()
                    }
                }
            }
            .alert("Details missing", isPresented: $showValidationAlert, actions: {
                // add custom buttons for alert view here
            }, message: {
                Text("Please enter book details correctly")
            })
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}

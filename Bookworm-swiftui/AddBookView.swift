//
//  AddBookView.swift
//  Bookworm-swiftui
//
//  Created by Aldiyar B on 6/3/20.
//  Copyright © 2020 Aldiyar B. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Thriller", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker(selection: $genre, label: Text("Genre")) {
                        ForEach(genres, id: \.self, content: {
                            Text($0)
                        })
                    }
                    
                    Section {
                        Picker(selection: $rating, label: Text("Rating")) {
                            ForEach(0..<6, content: {
                                Text("\($0)")
                            })
                        }
                        TextField("Review", text: $review)
                    }
                    
                    Section {
                        Button(action: {
                            //
                        }) {
                            Text("Save")
                        }
                    }
                    
                }
            }.navigationBarTitle("Bookworm")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

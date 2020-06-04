//
//  DetailedBookView.swift
//  Bookworm-swiftui
//
//  Created by Aldiyar B on 6/3/20.
//  Copyright © 2020 Aldiyar B. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailedBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    let book: Book
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing, content: {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geo.size.width)
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                })
                HStack(alignment: .bottom) {
                    Text(self.book.author ?? "Unknown author")
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    self.renderDate(date: self.book.date)
                }
                .padding()
                Text(self.book.review ?? "No review")
                    .padding()
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                Spacer()
            } 
            .navigationBarTitle(Text(self.book.title ?? "Unknown Book"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }, label: {
            Image(systemName: "trash")
        }))
            .alert(isPresented: self.$showingDeleteAlert, content: {
                Alert(title: Text("Delete Book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                    self.deleteBook()
                    }, secondaryButton: .cancel())
            })
        }
    }
    
    // LOGIC
    
    func renderDate(date: Date?) -> some View {
        if let date = date {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let dateString = formatter.string(from: date)
            return Text("Created at \(dateString)")
        }
        return Text("N/A")
    }
    
    func deleteBook() {
        moc.delete(book)
        
        // try? self.moc.save()
        
        presentationMode.wrappedValue.dismiss()
        
        
    }
}

struct DetailedBookView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.author = "Author"
        book.genre = "Fantasy"
        book.rating = 3
        book.review = "Test Review"
        book.title = "Book Title"
        return NavigationView {
            DetailedBookView(book: book)
        }
    }
}

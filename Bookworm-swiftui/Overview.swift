////
////  ContentView.swift
////  Bookworm-swiftui
////
////  Created by Aldiyar B on 6/3/20.
////  Copyright © 2020 Aldiyar B. All rights reserved.
////
//
//import SwiftUI
//
//// Combining CoreData and SwiftUI
//
//struct CoreDataAndSwiftUI: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
//    
//    var body: some View {
//        VStack {
//            List {
//                ForEach(students, id: \.id) { student in
//                    Text(student.name ?? "Unknown")
//                    
//                }
//            }
//            Button(action: {
//                let firstName = ["Al", "Joe", "Beck", "Heck"]
//                let lastName = ["Bobby", "Sins", "Cole", "Jim"]
//                let chosenFirstName = firstName.randomElement()
//                let chosenLastName = lastName.randomElement()
//                
//                let student = Student(context: self.moc)
//                student.id = UUID()
//                student.name = "\(chosenFirstName ?? "First") \(chosenLastName ?? "Last")"
//                
//                try? self.moc.save()
//            }, label: {
//                Text("Add")
//            })
//        }
//    }
//}
//
////Using size classes with ANyView type erasure
//
//struct SizeClassView: View {
//    @Environment(\.horizontalSizeClass) var sizeClass
//    
//    var body: some View {
//        
//        // based on the size of the screen it returns either compact or regular label
//        // AnyView basically allows us to return different view types e.g. HStack vs VStack, but performance hurts.
//        if sizeClass == .compact {
//            return AnyView(HStack {
//                Text("Active size class:")
//                Text("Compact")
//            }
//            .font(.largeTitle))
//        } else {
//            return AnyView(HStack {
//                Text("Active size class:")
//                Text("Regular")
//            }
//            .font(.largeTitle))
//        }
//    }
//}
//
//// Creating a custom component with @Binding
//
//struct PushBotton: View {
//    let title: String
//    // used to pass a state from parent view
//    @Binding var isOn: Bool
//    
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//    
//    var body: some View {
//        Button(action: {
//            self.isOn.toggle()
//        }, label: {
//            Text(title)
//        })
//            .padding()
//            .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//            .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//struct StructWithBinding: View {
//    @State private var rememberMe = false
//    var body: some View {
//        VStack {
//            PushBotton(title: "Remeber Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//            Toggle(isOn: $rememberMe, label: {
//                Text("Remember Me")
//            })
//                .padding(.horizontal)
//        }
//    }
//}
//
//struct OverviewView: View {
//    var body: some View {
//        CoreDataAndSwiftUI()
//    }
//}
//
//struct OverviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        OverviewView()
//    }
//}

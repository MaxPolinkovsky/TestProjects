//
//  TasksView.swift
//  ToDo
//
//  Created by Max Polinkovsky on 17.07.21.
//

import SwiftUI
import CoreData

struct TasksView: View {
    
    var rowHeight: CGFloat = 50
    
    @State var searchText = ""
    @State var searching = false
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", false), animation: .default)
    
    var fetchedItems: FetchedResults<ToDoItem>
    
    @State var newTaskTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText, searching: $searching)
                List {
                    if searching {
                        ForEach(fetchedItems.filter({ (item: ToDoItem) -> Bool in
                            return item.taskTitle!.hasPrefix(searchText) || searchText == ""
                        }), id:\.self) { searchResult in
                            HStack {
                                Text(searchResult.taskTitle ?? "Empty")
                                Spacer()
                                Button(action: {
                                    markTaskAsDone(at: fetchedItems.firstIndex(of: searchResult)!)
                                }){
                                    Image(systemName: "circle")
                                        .imageScale(.large)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .frame(height: rowHeight)
                        
                    } else  {
                        
                        ForEach(fetchedItems, id: \.self) { item in
                            HStack {
                                Text(item.taskTitle ?? "Empty")
                                Spacer()
                                Button(action: {
                                    markTaskAsDone(at: fetchedItems.firstIndex(of: item)!)
                                }){
                                    Image(systemName: "circle")
                                        .imageScale(.large)
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(height: rowHeight)
                        }
                        HStack {
                            TextField("Add task...", text: $newTaskTitle, onCommit: {
                                saveTask()
                            })
                            Button(action: {
                                saveTask()
                            }) {
                                Image(systemName: "plus")
                                    .imageScale(.large)
                            }
                        }
                        .frame(height: rowHeight)
                        NavigationLink(destination: TasksDoneView()) {
                            Text("Tasks done")
                                .frame(height: rowHeight)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle(searching ? "Searching" : "To-Do")
                .toolbar {
                    if searching {
                        Button("Cancel") {
                            searchText = ""
                            withAnimation {
                                searching = false
                                UIApplication.shared.dismissKeyboard()
                            }
                        }
                    }
                }
                .gesture(DragGesture()
                            .onChanged({ _ in
                                UIApplication.shared.dismissKeyboard()
                            }))
            }
        }
    }
    
    
    func saveTask() {
        guard newTaskTitle != "" else {
            return
        }
        let newToDoItem = ToDoItem(context: viewContext)
        newToDoItem.taskTitle = newTaskTitle
        newToDoItem.createdAt = Date()
        newToDoItem.taskDone = false
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        newTaskTitle = ""
    }
    
    func markTaskAsDone(at index: Int) {
        let item = fetchedItems[index]
        item.taskDone = true
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

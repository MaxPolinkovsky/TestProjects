//
//  TasksDoneView.swift
//  ToDo
//
//  Created by Max Polinkovsky on 18.07.21.
//

import SwiftUI
import CoreData

struct TasksDoneView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", true), animation: .default)
    
    var fetchedItems: FetchedResults<ToDoItem>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedItems, id: \.self) { item in
                    HStack {
                        Text(item.taskTitle ?? "Empty")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    .frame( height: 50)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle(Text("Tasks Done"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    private func removeItems(at offsets: IndexSet) { //remove from Coredata
        for index in offsets {
            let item = fetchedItems[index]
            viewContext.delete(item)
        }
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TasksDoneView_Previews: PreviewProvider {
    static var previews: some View {
        TasksDoneView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//
//  SHContainersUITests.swift
//  SHContainers
//
//  Created by Samuel He on 2025/6/21.
//

import SwiftUI

struct Test1: View {
    @State var pickerSelection: PickerSelection = .a
    @State var dateStarted = Date()
    @State var dateFinished = Date()
    
    var body: some View {
        SHForm {
            SHSection("Watch Status", alignment: .center) {
                Picker(selection: $pickerSelection, content: {
                    ForEach(PickerSelection.allCases, id: \.self) { selection in
                        Text(selection.description).tag(selection)
                    }
                }) {}
                    .pickerStyle(.segmented)
                DatePicker(selection: $dateStarted, displayedComponents: [.date]) {
                    Text("Date Started")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Image(systemName: "ellipsis")
                    .alignmentGuide(VerticalAlignment.center) { _ in -6 }
                    .foregroundStyle(.secondary)
                DatePicker(selection: $dateFinished, displayedComponents: [.date]) {
                    Text("Date Finished")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
    
    enum PickerSelection: CaseIterable {
        case a,b,c
        
        var description: String {
            switch self {
            case .a: return "A"
            case .b: return "B"
            case .c: return "C"
            }
        }
    }
}

struct Test2: View {
    @State var name: String = ""
    @State var timeSaved: Date = Date()
    @State var tags: String = ""
    @State var notes: String = ""
    
    var body: some View {
        SHForm {
            SHSection("Basics") {
                TextField("Name for display", text: $name)
                Divider()
                DatePicker("Date acquired:", selection: $timeSaved, displayedComponents: [.date])
            }
            SHSection("Additionals") {
                TextField("Tags", text: $tags)
                Divider()
                if #available(iOS 16.0, *) {
                    TextEditor(text: $notes)
                        .scrollContentBackground(.hidden)
                        .frame(minHeight: 100, alignment: .top)
                } else {
                    // Fallback on earlier versions
                }
                Divider()
                Color.clear.frame(height: 100)
                
            }
            .padding(.bottom)
            Button("Save...") {}
        }
    }
}

#Preview {
    Test1()
}

#Preview {
    Test2()
}

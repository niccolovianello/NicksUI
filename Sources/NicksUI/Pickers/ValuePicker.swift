//
//  ValuePicker.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 07/08/25.
//

import SwiftUI

/// A generic view for selecting a value from a list.
///
/// `ValuePicker` displays a list of selectable items, highlighting the currently selected one.
/// It can be used with or without a toolbar content view.
///
/// - Parameters:
///   - T: The type of the selectable value, which must conform to `Identifiable` and `Hashable`.
///   - AllValues: A collection of all selectable values.
///   - ToolbarContent: An optional view displayed as the toolbar content.
public struct ValuePicker<
    T: Identifiable & Hashable,
    AllValues: RandomAccessCollection<T>,
    ToolbarContent: View
>: View {
    
    @Environment(\.dismiss) private var dismiss
    
    private let title: LocalizedStringKey
    private let selectedValue: Binding<T>
    private let allValues: AllValues
    private let backgroundColor: Color
    private var toolbarContent: ToolbarContent?
    
    public init(
        _ title: LocalizedStringKey,
        selectedValue: Binding<T>,
        allValues: AllValues,
        backgroundColor: Color,
        @ViewBuilder toolbarContent: () -> ToolbarContent
    ) {
        self.title = title
        self.selectedValue = selectedValue
        self.allValues = allValues
        self.backgroundColor = backgroundColor
        self.toolbarContent = toolbarContent()
    }
    
    public var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            List(allValues) { value in
                HStack {
                    Text(value.id as? String ?? "unknown value")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(4)
                    
                    if value == selectedValue.wrappedValue {
                        Image(systemName: "checkmark")
                    }
                }
                .background(backgroundColor.opacity(0.001))
                .makeButton {
                    selectedValue.wrappedValue = value
                    dismiss()
                }
            }
            .navigationTitle(title)
            .toolbar {
                toolbarContent
            }
        }
    }
}

public extension ValuePicker where ToolbarContent == EmptyView {
    init(
        _ title: LocalizedStringKey,
        selectedValue: Binding<T>,
        allValues: AllValues,
        backgroundColor: Color
    ) {
        self.init(title, selectedValue: selectedValue, allValues: allValues, backgroundColor: backgroundColor, toolbarContent: { EmptyView() })
    }
}

enum Item: String, Identifiable, Hashable, CaseIterable {
    case a, b, c
    var id: String { rawValue }
}

#Preview {
    @Previewable @State var selected: Item = .a
    
    NavigationStack {
        NavigationLink {
            ValuePicker(
                "Select a value",
                selectedValue: $selected,
                allValues: Item.allCases,
                backgroundColor: .gray.opacity(0.1)
            )
        } label: {
            VStack(alignment: .leading) {
                Text("Test")
                    .font(.footnote.weight(.medium))
                    .foregroundStyle(.secondary)
                
                Text(selected.id)
            }
        }
    }
}

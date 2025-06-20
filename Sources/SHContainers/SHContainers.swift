// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public typealias SHForm = SHList

public struct SHList<Content: View>: View {
    var content: Content
    let alignment: HorizontalAlignment
    
    public init(@ViewBuilder content: () -> Content, alignment: HorizontalAlignment = .leading) {
        self.content = content()
        self.alignment = alignment
    }
    
    public var body: some View {
        Color(.systemGroupedBackground)
            .ignoresSafeArea(.all)
            .overlay{
                ScrollView {
                    LazyVStack(alignment: alignment, spacing: 20) {
                        content
                            .buttonStyle(.bordered)
                    }
                }
                .padding(20)
            }
    }
}

public struct SHSection<Content: View>: View {
    var content: () -> Content
    let alignment: HorizontalAlignment
    let title: LocalizedStringKey?
    let spacing: CGFloat
    
    public init(_ title: LocalizedStringKey?,
         alignment: HorizontalAlignment = .leading,
         spacing: CGFloat = 10,
         @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }
    
    public var body: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            if let title {
                Text(title)
                    .font(.footnote)
                    .textCase(.uppercase)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
                    .padding(.leading, 20)
            }
            LazyVStack(alignment: alignment, spacing: spacing) {
                content()
            }
            .padding(.top, 10)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.background)
            }
        }
        .buttonStyle(.borderless)
    }
}

public struct SHRow<Content: View>: View {
    @ViewBuilder var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content()
            .padding(.top, 10)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.background)
            }
    }
}


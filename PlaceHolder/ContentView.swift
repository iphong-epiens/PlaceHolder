//
//  ContentView.swift
//  PlaceHolder
//
//  Created by Inpyo Hong on 2021/12/03.
//

import SwiftUI

struct ContentView: View {
    @State var text : String = ""
    
    var body: some View {
        
        VStack {
            ZStack {
                Color(.systemGray6)
                
                TextField("", text: $text, onEditingChanged: { (changing) in
                    print("Changing: \(changing)")
                }, onCommit: {
                    print("Committed!")
                })
                    .placeHolder(Text("Your placeholder").foregroundColor(Color("blueGrey")), show: text.isEmpty)
                    .padding()
                    .background(Color(.systemGray6))
            }
            .cornerRadius(5)
            .frame(height: 44)
            .padding(.horizontal, 20)
            
            Spacer()
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Reference: https://stackoverflow.com/a/62950092

struct PlaceHolder<T: View>: ViewModifier {
    var placeHolder: T
    var show: Bool
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show { placeHolder }
            content
        }
    }
}

extension View {
    func placeHolder<T:View>(_ holder: T, show: Bool) -> some View {
        self.modifier(PlaceHolder(placeHolder:holder, show: show))
    }
}

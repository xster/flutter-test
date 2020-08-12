//
//  ContentView.swift
//  t165_symbols
//
//  Created by Xiao Yu on 7/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack(alignment: .leading) {
        Text("Hello, world!").padding()
          .font(.largeTitle)
          .foregroundColor(.blue)
        Image()
      }
//      UIImage(systemName: "play")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

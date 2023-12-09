//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var contadorFollowers = 31200
    var body: some View {
        HStack{
            Image("WhiteSquare")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100)
                .clipShape(.circle)
                .shadow(radius: 10)
                .overlay {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 92)
                        .clipShape(.circle)
                        .shadow(radius: 10)
                }
            VStack(alignment: .leading) {
                Text("**Lorem Ipsum**")
                    .font(.headline)
                    .fontDesign(.rounded)
                    .foregroundStyle(.primary)
                Text("Amateur photographer adn hobbits")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                HStack(){
                    Button("Follow") {
                        print("do something")
                        contadorFollowers += 1
                    }
                    .buttonStyle(.borderedProminent)
                    Text("\(contadorFollowers)followers")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                        .padding(.top,5)
                }
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

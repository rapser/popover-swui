//
//  ContentView.swift
//  popover-swui
//
//  Created by miguel tomairo on 4/6/20.
//  Copyright © 2020 rapser. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var show = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing, content: {
            
            VStack {
                HStack {
                    Text("Popover")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                    .padding([.horizontal, .bottom])
                    .background(Color.green)
                
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 15) {
                
                if self.show {
                    PopOver()
                    .background(Color.white)
                    .clipShape(ArrowShape())
                    .cornerRadius(15)
                    .offset(y: 15)
                }
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        self.show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: self.show ? "xmark" : "arrow.up")
                        .resizable()
                        .frame(width:20, height: 22)
                        .foregroundColor(.green)
                        .padding()
                }.background(Color.white)
                .clipShape(Circle())
                
            }.padding()
            
        }).edgesIgnoringSafeArea(.top)
            .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
        
    }
        
}

struct PopOver: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            
            Button(action: {
                
            }) {
                HStack(spacing: 15){
                    Image("home")
                        .renderingMode(.original)
                    Text("Home")
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                HStack(spacing: 15){
                    Image("search")
                        .renderingMode(.original)
                    Text("Search")
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                HStack(spacing: 15){
                    Image("heart")
                        .renderingMode(.original)
                    Text("Likes")
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                HStack(spacing: 15){
                    Image("person")
                        .renderingMode(.original)
                    Text("Account")
                }
            }
            
        }.frame(width:140)
        .foregroundColor(.black)
        .padding()
        .padding(.bottom, 20)

    }
}

struct ArrowShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let center = rect.width / 2
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 20))
            
            path.addLine(to: CGPoint(x: center - 15, y: rect.height - 20))
            path.addLine(to: CGPoint(x: center, y: rect.height - 5))
            path.addLine(to: CGPoint(x: center + 15, y: rect.height - 20))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height - 20))
        }
    }
}

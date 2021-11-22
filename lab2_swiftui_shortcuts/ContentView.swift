//
//  ContentView.swift
//  lab2_swiftui_shortcuts
//
//  Created by Rayan Taj on 15/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    var shortcutArray = [
        Shortuct(name: "Video Downloader", desc: "download quickly", iconString: "chevron.down.circle", color: .blue),
        
        Shortuct(name: "Apple", desc: "hello", iconString: "trash.slash.circle", color: .red ),
        
        Shortuct(name: "Call mom", desc: "idk", iconString: "phone.circle", color:.green ),
        
        Shortuct(name: "Buy coffee", desc: "get caffeine", iconString: "paperplane.circle.fill", color:.purple ),
        
        Shortuct(name: "post a tweet", desc: "for the followers", iconString: "paperplane.circle.fill", color:.brown ),

        Shortuct(name: "Take a break", desc: "12 actions", iconString: "paperplane.circle.fill", color:.red ),

        Shortuct(name: "shazam ", desc: "get song", iconString: "paperplane.circle.fill", color:.cyan ),

        
        
        
        
        
        
        
        
        
    ]
    
    var columns: [GridItem] =
    Array(repeating: .init(.flexible()), count: 2)
    
    @State private var searchText = ""

    var body: some View {
        
        NavigationView {
            
                 
            ScrollView {
                
                VStack{
               
                        
                    
                    LazyVGrid(columns: columns ) {
                        
                        ForEach(shortcutArray, id: \.self) { item in
                            
                            ShortcutCard(icon: item.iconString, titleLable: item.name, descLable: item.desc , cardColor: item.color)
                               
                            
                        }
                        
                    }.font(.largeTitle)
                        .searchable(text: $searchText)
                           .navigationTitle("All Shortcuts")
                } .padding(.horizontal , 15)
            
            }
             }
        
     
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ShortcutCard: View {
    
    @State var icon : String
    @State var titleLable  : String
    @State var descLable : String
    @State var cardColor : Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .circular)
                .foregroundColor(cardColor)
                .frame(width: UIScreen.main.bounds.width * 0.45 , height:  UIScreen.main.bounds.height * 0.13)
            
            VStack(alignment: .leading) {
                HStack{
                    
                    Image(systemName: icon)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            Image(systemName: "ellipsis.circle.fill")
                                .foregroundColor(.white)
                                .frame(width:5, height: 5)
                            
                        }
                        .padding(.trailing , 10)
                        
                    })
                    
                    
                }
                
                Spacer()
                
                Text(titleLable).font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Text(descLable).font(.system(size: 12))
                    .foregroundColor(.white)
                    .fontWeight(.light)
            }
            .frame(width: UIScreen.main.bounds.width * 0.40 , height:  UIScreen.main.bounds.height * 0.11)
            
        }
    }
}

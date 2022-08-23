//
//  ContentView.swift
//  CW8
//
//  Created by fawziah hussain on 20/08/2022.
//

import SwiftUI

struct ContentView: View {
    let colors =
    [Color.indigo.opacity(0.4),
     Color.blue.opacity(0.4),
     Color.yellow.opacity(0.4),
     Color.pink.opacity(0.4)]
    @State var myNote = " "
    @State var save = ""
    @State var slc : Color = Color.indigo
    var body: some View {
        NavigationView{
            ZStack{
                Color.red.opacity(0.4)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("اختر الون المفضل ")
                            .font(
                                .system(size: 25))
                    
                    HStack{
                      ForEach(colors,
                              id:\.self){
                      color in
                          
                          Circle()
                             .fill(color)
                             .frame(width: 50, height: 50)
                              .onTapGesture {
                               slc = color
                              }
                      }
                    .padding()
                    }
                    Text("ماذا تريد ان تكتب")                               .font(
                        .system(size: 20))

                    TextField("اكتب هنا",text:$myNote)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Spacer()
                        .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: SecondView(myC: slc, myS: myNote)) { Text("حفظ")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .frame(width: 200, height: 50)
                            .background(.green)
                            .cornerRadius(10)
                        
                        }
                    }
                } .navigationTitle("دفتر يومياتي")
            }
      
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

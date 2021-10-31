//
//  ContentView.swift
//  AnimatedLoginPage
//
//  Created by Ersan Çetin on 31.10.2021.
//

import SwiftUI
import Lottie



struct ContentView: View {
    var body: some View {
       
        LoginScreen()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoginScreen: View {
    
    @State var show = false
    
    //login
    
    @State var userName = ""
    
    
    var body: some View{
        VStack{
            
            ZStack {
                
                Color.white
                    .ignoresSafeArea()

                VStack{
                    AnimatedView(show: $show)
                        .frame(width: UIScreen.main.bounds.width / 2  , height: UIScreen.main.bounds.height / 2)
                    
                    VStack{
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                Text("Login")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("Enter your username")
                                    .foregroundColor(.gray)
                                
                            })
                            Spacer(minLength: 10)
                        }
                        
                        VStack {
                            HStack{
                                
                                TextField("", text: $userName)
                                    
                            }
                            
                            Divider()
                                .background(Color.black)
                            
                        }
                        
                        .padding(.vertical)
                        
                        Button(action: {}, label: {
                            Text("Verify your username")
                                .fontWeight(.bold)
                        })
                        
                        .padding(5)
                        
//                        HStack(spacing: 30){
//
//                            Button(action: {}, label: {
//
//                                HStack(spacing: 10){
//
//                                    Image("twitter")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 25, height: 25)
//                                    Text("Twitter")
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.blue)
//
//                                }
//                                .padding(10)
//                                .frame(width: UIScreen.main.bounds.width - 200)
//                                .background(Color.black.opacity(0.1))
//                                .clipShape(Capsule())
//
//
//                            })
                            
                            
//                        }
                        
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2))
                    .background(Color.white)
                    .padding()

                    .frame(height: show ? nil : 0)
                    .opacity(show ? 1 : 0)
                    
                }
            }
            
        }
    }
    
}

//animated view

struct AnimatedView: UIViewRepresentable {
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        
        let view = AnimationView(name: "animation", bundle: Bundle.main)
        
        //on complete start animation again
        
        view.play { (status) in
            
            if status {
                
                //toggling
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                show.toggle()
                }
            }
            
        }
        
        return view
        
        
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
    
}

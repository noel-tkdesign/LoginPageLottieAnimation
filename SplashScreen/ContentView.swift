//
//  ContentView.swift
//  SplashScreen
//
//  Created by Koji Kawakami on 2022/08/27.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        
        SplashScrenn()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}

struct SplashScrenn : View {
    @State var show = false
    
    // Login Details...
    
    @State var phNo = ""
    
    var body: some View{
        
        VStack{
            
            ZStack{
                
                Color("bg")
                    .ignoresSafeArea()
                
                VStack{

                    AnimatedView(show: $show)
                    // default Frame
                        .frame(width:UIScreen.main.bounds.width / 2,height: UIScreen.main.bounds.height / 2)
                        .padding(.bottom, -35)
                    
                    VStack{
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                Text("Login")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("Enter your phone number to continue")
                                    .foregroundColor(.gray)
                            })
                            
                            Spacer(minLength: 15)
                        }
                        VStack{
                        HStack(spacing: 15){
                            
                            Text("+1")
                                .foregroundColor(.black)
                            
                            Rectangle()
                                .fill(Color("bg"))
                                .frame(width: 1, height: 18)
                            
                            TextField("", text: $phNo)
                        }
                        Divider()
                            .background(Color("bg"))
                    }
                        .padding(.vertical)
                        
                        Button{
                            
                        }label: {
                            Text("Verify Your Number")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .frame(width:UIScreen.main.bounds.width - 30)
                                .background(Color("bg"))
                                .clipShape(Capsule())
                        }
                        HStack{
                            Rectangle()
                                .fill(.gray)
                                .frame( height: 1)
                            Text("OR")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            Rectangle()
                                .fill(.gray)
                                .frame( height: 1)
                        }
                        .padding(.vertical)
                        
                        HStack(spacing: 20){
                            Button{
                                
                            }label: {
                                HStack(spacing: 10){
                                    
                                    Image("tw")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .padding(.leading,-15)
                                    
                                    Text("twitter")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                }
                                    .padding(.vertical,10)
                                    .frame(width:(UIScreen.main.bounds.width - 50) / 2)
                                    .background(Color("tw"))
                                    .clipShape(Capsule())
                            }
                            
                            Button{
                                
                            }label: {
                                HStack(spacing: 15){
                                    
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .padding(.leading,-15)
                                    
                                    Text("Google")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                }
                                    .padding(.vertical,10)
                                    .frame(width:(UIScreen.main.bounds.width - 50) / 2)
                                    .background(Color("google"))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .frame(width: 340)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    
                    // Button to up Transiton
                    
                    // we can acheive this by frame
                    .frame( height: show ? nil : 0)
                    .opacity(show ? 1 : 0)
                }
               
                    
            }
        }
       
    }
}

struct AnimatedView: UIViewRepresentable {
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: "fitness", bundle: Bundle.main)
        
        // on Complete....
        view.play{(status) in
            
            if status{
                
                // toggling view...
                withAnimation(.interactiveSpring(response:0.7 , dampingFraction: 0.8, blendDuration: 0.8)){
                    show.toggle()
                }
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}

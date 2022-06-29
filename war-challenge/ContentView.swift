//
//  ContentView.swift
//  war-challenge
//
//  Created by Michael Garcia on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack{
            //background image
            Image("background").ignoresSafeArea()
            //vstack main container
            VStack{
                Spacer()
                Image("logo")
                //2 cards
                Spacer()
                HStack{
                  Spacer()
                  Image(playerCard)
                  Spacer()
                  Image(cpuCard)
                  Spacer()
                }
                Spacer()
                //deal button outside hstack
                Button (action: {
                    //generate random number 2-14
                    let playerRan = Int.random(in: 2...14)
                    let cpuRan = Int.random(in: 2...14)
                    
                    //update cards
                    playerCard = "card" + String(playerRan)
                    cpuCard = "card" + String(cpuRan)
                    //update Score
                    if(playerRan > cpuRan){
                        playerScore += 1
                    }
                    else if(cpuRan > playerRan){
                        cpuScore += 1
                    }
                    else{
                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                        generator.impactOccurred()
                    }
                    
                }, label: {
                    Image("dealbutton")
                })

                Spacer()
                //player score
                HStack{
                    //vertical stack w player score
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    //vertical stack w player score
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Flags.swift
//  Project1
//
//  Created by Adam El-Telbani on 2/21/25.
//

import SwiftUI

struct Flags: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var points = 0

    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.gray, .red, .black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 5) {
            
                    Text("Tap the flag of")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(countries[correctAnswer])
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    
                    VStack(spacing: 30) {
                        
                        ForEach(0..<3, id: \.self) { number in
                            Button {
                                checkAnswer(selected: countries[number])
                            } label: {
                                Image(countries[number])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 140)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .shadow(radius: 5)
                            }
                            
                        }
                        
                    }
                    Spacer().frame(height: 130)
                }
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Spacer().frame(height: 20)
                            HStack {
                                Text("Guess The Flag")
                                    .font(.system(size: 25, weight: .bold))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding()

                                Spacer()

                                Text("Score: \(points)")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.7))
                                    .clipShape(Capsule())
                                    .padding(.trailing, 20)
                            }
                        }
                    }
                }
                
                
                
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
                .padding()
            }
            
        }
    }

    func checkAnswer(selected: String) {
        if selected == countries[correctAnswer] {
            alertMessage = "Correct!"
            points += 1
        } else {
            alertMessage = "Wrong! The correct answer is \(countries[correctAnswer])"
            if points > 0 {
                points -= 1
            }
            else { points = 0}
        }
        showAlert = true
        countries.shuffle()
    }
}


struct Flags_Previews: PreviewProvider {
    static var previews: some View {
        Flags()
    }
}


//
//  HistoryTabView.swift
//  KinesiologyMemorizingHelperTool
//
//  Created by Nathan on 2022-11-03.
//

import SwiftUI

struct HistoryTabView: View {
    // MARK: Stored Properties
    
    @Binding var muscleOrBoneToSavedList: [BoneOrMuscleToSavedList]
    
    @State var selectionTrue: Int = 0
    
    // MARK: Computed Properties
    var body: some View {
        ZStack {
//            Color(.systemGray6)
//                .ignoresSafeArea()
            
            VStack {
                Picker(selection: $selectionTrue,
                       label: Text("selectionTypePicker"),
                       content: {
                    Text("No Filter").tag(1)
                    Text("Correct Answers").tag(2)
                    Text("Wrong Answers").tag(3)
                })
                .pickerStyle(SegmentedPickerStyle())
                
                List(filtered(from: muscleOrBoneToSavedList, selectionTrue: selectionTrue)) { currentMuscleOrBone in
                    HStack {
                        Image(currentMuscleOrBone.imageOne)
                            .resizable()
                            .scaledToFit()
                        Image(currentMuscleOrBone.imageTwo)
                            .resizable()
                            .scaledToFit()
                        Image(currentMuscleOrBone.imageThree)
                            .resizable()
                            .scaledToFit()
                        Text("\(currentMuscleOrBone.whichAnswerIsCorrect) was the correct answer")
                            .font(.title)
                            .fontWeight(.medium)
                        
                        ZStack {
                            Text("You got it right!")
                                .foregroundColor(.green)
                                .opacity(currentMuscleOrBone.isAnswerCorrect ? 1.0 : 0.0)
                                .font(.title)
                            
                            Text("You got it wrong :(")
                                .foregroundColor(.red)
                                .opacity(currentMuscleOrBone.isAnswerCorrect ? 0.0 : 1.0)
                                .font(.title)
                        }
                        ZStack {
                            Image(systemName: "x.square")
                                .foregroundColor(.red)
                                .opacity(currentMuscleOrBone.isAnswerCorrect ? 0.0 : 1.0)
                                .font(.system(size: 60))
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                                .opacity(currentMuscleOrBone.isAnswerCorrect ? 1.0 : 0.0)
                                .font(.system(size: 60))
                            
                        }
                    }
                }
            }
        }
    }
}
//
//struct HistoryTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabView {
//            HistoryTabView()
//                .tabItem {
//                    Label("History", systemImage: "list.dash")
//                }
//            AllBonesAndMuscles()
//                .tabItem {
//                    Label("All Bones And Muscles", systemImage: "books.vertical")
//                }
//            MainPageView()
//                .tabItem {
//                    Label("Questions", systemImage: "list.dash")
//                }
//        }
//    }
//}

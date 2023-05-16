//
//  TerpeneProfileView.swift
//  Flowr
//
//  Created by Andrew on 5/15/23.
// ok so the idea here is have a main view with a big ass nb

import SwiftUI

struct TerpeneProfileView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var globalData: GlobalData
    @EnvironmentObject var navigationUtil: NavigationUtil
//    @Binding var showingBuildProfile: Bool
//    @State private var showingFullScreenCover: Bool = false
//    @State private var showingSheet: Bool = false
    @State private var isPresentingEditEffectSheet: Bool = false
    @State private var isPresentingEditAromaSheet: Bool = false
    @State var effectSelections = [DataMap]()
    @State var aromaSelections = [DataMap]()
//    @State private var showingAromaHelp: Bool = false
//    @State private var showingAromaList: Bool = false
//    @State private var showingEffectList: Bool = false
//    @State private var showingEffectHelp: Bool = false
    //    @State private var showingAromaList: Bool = false
    var body: some View {
            VStack{
                List{
                    Section(header: Text("My Terpenes")){
                        if globalData.terpeneProfile.terpenes.count == 0 {
                            
                            BasicRow(title: "No Terpene Profile", description: "Setup a terpene profile by choosing cannabis effects and aromas below")
                            
                        } else {
                            ForEach(TerpeneUtil.loadTerpeneDataMapFromStrings(terpenes: self.globalData.terpeneProfile.terpenes)) {(dm: DataMap) in
                                
                                BasicRow(title: dm.key, description: dm.value)
                                
                            }
                            //                        BasicRow(title: "Dumb", description: "Description")
                            //                        globalData.terpeneProfile.terpenes.forEach({ terpene in
                            
                            //                        BasicRow(title: "Myrcene", description: "Description")
                            //                        })
                        }
                        //                    BasicRow(title: "Dumb", description: "Description")
                        //                    BasicRow(title: "Dumb", description: "Description")
                    }
                    Section(header: Text("Effects")){
                        if self.globalData.terpeneProfile.effects.count == 0 {
                            FullWidthButton(text: "Select Cannabis Effects", action: {self.isPresentingEditEffectSheet=true}).fullScreenCover(isPresented: $isPresentingEditEffectSheet){
                             
                                //        shouldPresentSheet=determineSheetPresentation()
                            NavigationStack{
                                //            VStack(alignment: .center){
                                
                                Section{
                                    List {
                                        ForEach(effectSearchResults, id: \.self) { item in
                                            
                                            Button(action: {
                                                self.isPresentingEditEffectSheet=false
                                                if !self.effectSelections.contains(item) {
                                                    self.effectSelections.append(item)
                                                }else{
                                                    self.effectSelections.removeAll(where: { $0 == item })
                                                }
//                                                }
//                                                else {
                                                    
//                                                }
                                                self.isPresentingEditEffectSheet=true
                                            }) {
                                                
                                    //            self.isSelected = self.isSelected==true
                                                HStack{
                                                    VStack (alignment: .leading){
                                                        Text(item.key).font(.headline)
                                                        
                                                    }
                                                    if self.effectSelections.contains( where: {$0.key==item.key}) {
                                                        Spacer()
                                                        Image(systemName: "checkmark")
                                                    }
                                                    
                                                }
                                            }.foregroundColor(.black)
                                            
                                        }
                                    }.searchable(text: $searchText)
                                }.navigationBarTitle("Effects").toolbar(content: {
                                    
                                    ToolbarItem(placement: .navigationBarLeading){
                                        Button(action:{
                                            self.isPresentingEditEffectSheet=false
                                        }){
                                            Text("Back").font(.headline).fontWeight(.bold).padding(10).cornerRadius(15).background(.blue).cornerRadius(15)
                                                .foregroundColor(.white)
                                                .clipShape(
                                                    
                                                    // 2
                                                    Capsule()
                                                )
                                        }.padding(.bottom)
//                                        BasicButton(text: "Back", font: .headline, action: {
//                                            self.isPresentingEditEffectSheet=false}).padding(.bottom).padding(.bottom)
//                                            print("Back button pressed")
                                        
                                    }
                                    ToolbarItem(placement: .navigationBarTrailing){
                                        Button(action:{
                                            self.isPresentingEditEffectSheet=false
                                            updateTerpeneProfileEffects()
                                        }){
                                            Text("Done").font(.headline).fontWeight(.bold).padding(10).cornerRadius(15).background(.blue).cornerRadius(15)
                                                .foregroundColor(.white)
                                                .clipShape(
                                                    
                                                    // 2
                                                    Capsule()
                                                )
                                        }.padding(.bottom)
                                                    }

                                })
                                
                            }
//
                            }
//                            FullWidthButton(text: "Select Cannabis Effects", destination: AnyView(MultipleSelectionList(data: TerpeneUtil.loadEffectDataMap(effects: TerpeneUtil.loadTerpeneEffects(terpenes: self.globalData.terpenes)), navigationBarTitle: "Effects",action: {self.navigationUtil.navigationPath.removeLast(self.navigationUtil.navigationPath.count)})))
                        }else{
                            
                            //                        List {
                            ForEach(TerpeneUtil.loadEffectDataMap(effects: self.globalData.terpeneProfile.effects)) {(dm: DataMap) in
                                
                                BasicRow(title: dm.key, description: dm.value)
                                
                            }
                        }
                        
                        
                    }
                    
                    Section(header: Text("Aromas")){
                        if self.globalData.terpeneProfile.aromas.count == 0 {
                            FullWidthButton(text: "Select Cannabis Aromas", action: {self.isPresentingEditAromaSheet=true}).fullScreenCover(isPresented: $isPresentingEditAromaSheet){
                             
                                //        shouldPresentSheet=determineSheetPresentation()
                            NavigationStack{
                                //            VStack(alignment: .center){
                                
                                Section{
                                    List {
                                        ForEach(aromaSearchResults, id: \.self) { item in
                                            
                                            Button(action: {
//                                                self.isPresentingEditEffectSheet=false
                                                if !self.aromaSelections.contains(item) {
                                                    self.aromaSelections.append(item)
                                                }else{
                                                    self.aromaSelections.removeAll(where: { $0 == item })
                                                }
//                                                }
//                                                else {
                                                    
//                                                }
//                                                self.isPresentingEditEffectSheet=true
                                            }) {
                                                
                                    //            self.isSelected = self.isSelected==true
                                                HStack{
                                                    VStack (alignment: .leading){
                                                        Text(item.key).font(.headline)
                                                        
                                                    }
                                                    if self.aromaSelections.contains( where: {$0.key==item.key}) {
                                                        Spacer()
                                                        Image(systemName: "checkmark")
                                                    }
                                                    
                                                }
                                            }.foregroundColor(.black)
                                            
                                        }
                                    }.searchable(text: $searchText)
                                }.navigationBarTitle("Aromas").toolbar(content: {
                                    
                                    ToolbarItem(placement: .navigationBarLeading){
                                        Button(action:{
                                            self.isPresentingEditAromaSheet=false
                                        }){
                                            Text("Back").font(.headline).fontWeight(.bold).padding(10).cornerRadius(15).background(.blue).cornerRadius(15)
                                                .foregroundColor(.white)
                                                .clipShape(
                                                    
                                                    // 2
                                                    Capsule()
                                                )
                                        }.padding(.bottom)
//                                        BasicButton(text: "Back", font: .headline, action: {
//                                            self.isPresentingEditEffectSheet=false}).padding(.bottom).padding(.bottom)
//                                            print("Back button pressed")
                                        
                                    }
                                    ToolbarItem(placement: .navigationBarTrailing){
                                        Button(action:{
                                            self.isPresentingEditAromaSheet=false
                                            updateTerpeneProfileAromas()
                                        }){
                                            Text("Done").font(.headline).fontWeight(.bold).padding(10).cornerRadius(15).background(.blue).cornerRadius(15)
                                                .foregroundColor(.white)
                                                .clipShape(
                                                    
                                                    // 2
                                                    Capsule()
                                                )
                                        }.padding(.bottom)
                                                    }

                                })
                                
                            }
//
                            }
                            
//                            FullWidthButton(text: "Select Cannabis Aromas", destination: AnyView(MultipleSelectionList(data: TerpeneUtil.loadAromaDataMap(aromas: TerpeneUtil.loadTerpeneAromas(terpenes: self.globalData.terpenes)),navigationBarTitle: "Aromas", action: {self.navigationUtil.navigationPath.removeLast(self.navigationUtil.navigationPath.count)})))
                        }else{
                            
                            //                        List {
                            ForEach(TerpeneUtil.loadAromaDataMap(aromas: self.globalData.terpeneProfile.aromas)) {(dm: DataMap) in
                                
                                BasicRow(title: dm.key, description: dm.value)
                                
                            }
                        }
                    }
                    //            Section{
                    
                }
                
            }
        
        }
    
    var effectSearchResults: [DataMap] {
            if searchText.isEmpty {
                return TerpeneUtil.loadEffectDataMap(effects: TerpeneUtil.loadTerpeneEffects(terpenes: self.globalData.terpenes))
            } else {
                return TerpeneUtil.loadEffectDataMap(effects: TerpeneUtil.loadTerpeneEffects(terpenes: self.globalData.terpenes)).filter { $0.key.lowercased().contains(searchText.lowercased()) || $0.value.lowercased().contains(searchText.lowercased()) }
            }
        }
    
    var aromaSearchResults: [DataMap] {
            if searchText.isEmpty {
                return TerpeneUtil.loadAromaDataMap(aromas: TerpeneUtil.loadTerpeneAromas(terpenes: self.globalData.terpenes))
            } else {
                return TerpeneUtil.loadAromaDataMap(aromas: TerpeneUtil.loadTerpeneAromas(terpenes: self.globalData.terpenes)).filter { $0.key.lowercased().contains(searchText.lowercased()) || $0.value.lowercased().contains(searchText.lowercased()) }
            }
        }


    func updateTerpeneProfileEffects(){
//        var _res = [String]()
        self.globalData.terpeneProfile.effects.removeAll()
        self.effectSelections.forEach(){ dm in
            self.globalData.terpeneProfile.effects.append(dm.key)
        }
        
        
//        return _res
        
    }
    func updateTerpeneProfileAromas(){
//        var _res = [String]()
        self.globalData.terpeneProfile.aromas.removeAll()
        self.aromaSelections.forEach(){ dm in
            self.globalData.terpeneProfile.aromas.append(dm.key)
        }
        
        
//        return _res
        
    }
}


struct TerpeneProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneProfileView().environmentObject(GlobalData()).environmentObject(NavigationUtil())
    }
}

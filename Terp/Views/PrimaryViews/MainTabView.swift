//
//  MainTabView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI
import CoreData
struct MainTabView: View {
//    @EnvironmentObject var globalData: GlobalData
    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
//    @FetchRequest(sortDescriptors: []) var effects: FetchedResults<Effect>
//    @FetchRequest(sortDescriptors: []) var terpenes: FetchedResults<Terpene>
    @State private var selectedTab = 1
    var body: some View {
        
        
           TabView {
               NavigationView{FeedView()}.tabItem{
                   Label("Feed", systemImage: "house.fill")
               }.tag(1)
               NavigationView{ProfileView(user: User.example)}.tabItem{
                   Label("Profile", systemImage: "person.fill")
               }.tag(2)
               NavigationView{StrainSearchView()}.tabItem {
                       Label("Strain Search", systemImage: "magnifyingglass.circle")
                   }.tag(3)
               
               NavigationView{DiscoverView()}.tabItem{
                   Label("Discover", systemImage: "globe.americas")
               }.tag(4)
               
               
               MoreView().tabItem{
                   Label("More", systemImage: "ellipsis")
               }.tag(5)
               

//               OrderView()
//                   .tabItem {
//                       Label("Order", systemImage: "square.and.pencil")
//                   }
           }.onAppear(perform: {
               //ok so here is where we need to load in our data into core data if it doesn't exist
               
               print("Clearing old data")
               TerpeneUtil.deleteAromas(viewContext: self.viewContext)
               TerpeneUtil.deleteEffects(viewContext: self.viewContext)
               TerpeneUtil.deleteTerepenes(viewContext: self.viewContext)
               print("Loading data")
               TerpeneUtil.buildAromaCoreData(viewContext: self.viewContext)
               TerpeneUtil.buildEffectCoreData(viewContext: self.viewContext)
               TerpeneUtil.buildTerpeneCoreData(viewContext: self.viewContext)
               
           })
       
    
    
    
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()//.environmentObject(GlobalData())
//            .environmentObject()
    }
}

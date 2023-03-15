//
//  ContentView.swift
//  SwiftUIWithAlamofire
//
//  Created by Fatih Durmaz on 16.03.2023.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @State var users = [User]()
    
    var body: some View {
        NavigationStack{
            List(users){ user in
                HStack{
                    Text("\(user.id)")
                        .padding()
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("SwiftUI & Alamofire")
        }
    }
    
    func loadData(){
        AF.request("https://jsonplaceholder.typicode.com/users")
            .responseDecodable(of:[User].self){
                response in
                guard let users = response.value else {return}
                self.users = users
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  ReceiptLogger4.0
//
//  Created by Ridhima on 6/18/22.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn = false
    
   
    var isSignedIn: Bool {
        return (auth.currentUser != nil)
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            //Sucess
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            //Sucess
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
        
    }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }

}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
       // NavigationView {
            if viewModel.signedIn {
                ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
                    NavigationView{
                        Home()
                            .navigationBarHidden(true)
                    }
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                .background(Color("BG"))
                // GraphView()
                /* VStack {
                   Text("You are signed in")
                    Button(action: {viewModel.signOut()
                    }, label: {
                        Text("Sign Out")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .padding()
                        
                        
                    })
                } */
               
            }
            else {
                SignInView()
                 }
       // }
      //  .onAppear{
      //      viewModel.signedIn=viewModel.isSignedIn
      //  }
    }
}

//start signinview
struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
          VStack{
              
              
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                VStack{
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                        
                    },
                           
                           label: {
                        Text("Sign In")
                            .foregroundColor(Color.black)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                            
                        
                    })
                    
                    NavigationLink("Create Account", destination: SignUpView())
                        .foregroundColor(Color.black)
                        .padding()
                        
                }
                .padding()
                
                Spacer()
                
            }
            .navigationTitle("Sign In")
            .background(
                Image("wallgreens1")
                    .resizable()
            
            )
//            .background(LinearGradient(colors: [
//                Color("Gradient3"),
//                Color("Gradient2"),
//
//            ], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
        
}
//end

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                VStack{
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                        
                    },
                           
                           label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                        
                    })
                        
                }
                .padding()
                
                Spacer()
                
            }
            .navigationTitle("Create Account")
    }
}
//end

//Graph View starts
struct GraphView: View {
    
    var body: some View {

      ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
            
            Home()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
        
        
    }
    
}


struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}

//Graph view ends


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

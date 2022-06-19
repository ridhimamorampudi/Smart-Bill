//
//  NewExpense.swift
//  ExpenseTracker (iOS)
//
//  Created by Ridhima on 6/19/22.
//

import SwiftUI
import Vision
import UIKit



struct NewExpense: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    // MARK: Environment Values
    @Environment(\.self) var env
    
    @State var navigationFlag = false
    var body: some View {
        if !self.navigationFlag {
            VStack{
                VStack(spacing: 15){
                    Text("Add Item")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .opacity(0.5)
                    
                    // MARK: Custom TextField
                    // For Currency Symbol
                    if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first{
                        TextField("0", text: $expenseViewModel.amount)
                            .font(.system(size: 35))
                            .foregroundColor(Color("Gradient2"))
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .background{
                                Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                    .font(.system(size: 35))
                                    .opacity(0)
                                    .overlay(alignment: .leading) {
                                        Text(String(symbol))
                                            .opacity(0.5)
                                            .offset(x: -15, y: 5)
                                    }
                            }
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity)
                            .background{
                                Capsule()
                                    .fill(.white)
                            }
                            .padding(.horizontal,20)
                            .padding(.top)
                    }
                    
                    // MARK: Custom Labels
                    Label {
                        TextField("Remark",text: $expenseViewModel.remark)
                            .padding(.leading,10)
                    } icon: {
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                            .font(.title3)
                            .foregroundColor(Color("Gray"))
                    }
                    .padding(.vertical,20)
                    .padding(.horizontal,15)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.white)
                    }
                    .padding(.top,25)
                    
                    Label {
                        // MARK: CheckBoxes
                        CustomCheckboxes()
                    } icon: {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.title3)
                            .foregroundColor(Color("Gray"))
                    }
                    .padding(.vertical,20)
                    .padding(.horizontal,15)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.white)
                    }
                    .padding(.top,5)
                    
                    Label {
                        DatePicker.init("", selection: $expenseViewModel.date,in: Date.distantPast...Date(),displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading,10)
                    } icon: {
                        Image(systemName: "calendar")
                            .font(.title3)
                            .foregroundColor(Color("Gray"))
                    }
                    .padding(.vertical,20)
                    .padding(.horizontal,15)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.white)
                    }
                    .padding(.top,5)
                }
                .frame(maxHeight: .infinity,alignment: .center)
                
                // MARK: Save Button
                Button(action: {expenseViewModel.saveData(env: env)}) {
                    Text("Save Item")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.vertical,15)
                        .frame(maxWidth: .infinity)
                        .background{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(
                                    LinearGradient(colors: [
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient3"),
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                        }
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                }
                .disabled(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "")
                .opacity(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "" ? 0.6 : 1)
            }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            // MARK: Close Button
            Button {
                env.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
                    .opacity(0.7)
            }
            .padding()
            
            
            
        }
        }
        
        NavigationView {
                    VStack {
                        Button(action: {
                                           self.navigationFlag = true
                                       }, label: {
                                           Image(systemName: "qrcode")
                                               .font(.title3)
                                               
                                               .frame(width: 55, height: 55, alignment: .center)
                                               .background{
                               //                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                                   Circle()
                                                       .fill(
                                                           LinearGradient(colors: [
                                                               Color("Gradient1"),
                                                               Color("Gradient2"),
                                                               Color("Gradient3"),
                                                           ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                       )


                                               }
                                               .foregroundColor(.white)
                                               .padding(.bottom,10)

                                       })
                                       
                        NavigationLink(destination: ImagePick(),
                                isActive: self.$navigationFlag,
                                label: {
                                EmptyView()
                                  })
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,alignment: .center)
            }
        
//         MARK Scan button
//        Button(action: {expenseViewModel.saveDataFromScannedCopy(env: env)}) {
//            Image(systemName: "qrcode")
//                .font(.title3)
////                .fontWeight(.semibold)
////                .padding(.vertical,15)
////                .frame(maxWidth: .infinity)
//                .frame(width: 55, height: 55)
//                .background{
////                    RoundedRectangle(cornerRadius: 12, style: .continuous)
//                    Circle()
//                        .fill(
//                            LinearGradient(colors: [
//                                Color("Gradient1"),
//                                Color("Gradient2"),
//                                Color("Gradient3"),
//                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
//                        )
//
//
//                }
//                .foregroundColor(.white)
//                .padding(.bottom,10)
//
////            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
//
//
//        }
        
//        NavigationLink(destination: SecondView(),
//            label: {
//                Text("plus")
//            })
        
        
        }
    
    
    struct SecondView: View {
        
        var body: some View{
            VStack {
                Text("Hello World")
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .background(Color.red)
        }
        
    }
    
    
    // MARK: Checkboxes
    @ViewBuilder
    func CustomCheckboxes()->some View{
        HStack(spacing: 10){
            ForEach([ExpenseType.income,ExpenseType.expense],id: \.self){type in
                ZStack{
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black,lineWidth: 2)
                        .opacity(0.5)
                        .frame(width: 20, height: 20)
                    
                    if expenseViewModel.type == type{
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundColor(Color("Green"))

                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    expenseViewModel.type = type
                }
                
                Text(type.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .opacity(0.7)
                    .padding(.trailing,10)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.leading,10)
    }
}

struct ImagePick: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State public var showPreview = false
    
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    
    
    var body: some View {
        
        VStack {
            if showPreview {
                Image(uiImage: self.image)
                  .resizable()
//                  .cornerRadius(100)
                  .frame(width: 180, height: 400)
                  .background(Color.white.opacity(0.2))
                  .aspectRatio(contentMode: .fill)
            }
//                  .clipShape(Circle())
             if !showPreview
            {
                 Text("Choose Receipt")
                     .font(.headline)
                     .frame(minWidth: 0, maxWidth: .infinity)
                     .frame(height: 50)
                     .background(LinearGradient(gradient: Gradient(colors: [Color("Gradient1"), Color("Gradient2")]), startPoint: .top, endPoint: .bottom))
                     .cornerRadius(16)
                     .foregroundColor(.white)
                         .padding(.horizontal, 20)
                         .onTapGesture {
                          
                           showSheet = true
                             showPreview = true
                           
                         }
             }
            else {
                
                Button(action: {expenseViewModel.saveDataFromScannedCopy(env: env)}) {
                    Text("Accept Receipt")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.vertical,15)
                        .frame(maxWidth: .infinity)
                        .background{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(
                                    LinearGradient(colors: [
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient3"),
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                        }
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                   
                }
                
                
            }
           
        }
    .padding(.horizontal, 20)
    .sheet(isPresented: $showSheet) {
                // Pick an image from the photo library:
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            

                //  If you wish to take a photo from camera instead:
                // ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
        
        
        
        
    }
    
    
    
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
   
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker
        

        init(_ parent: ImagePicker) {
            print("I am in Coordinator")
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            print("I am in image pick controller before parent ")

            parent.presentationMode.wrappedValue.dismiss()
            
            
            
//            let imageView: UIImageView = {
//                let imageView = UIImageView()
//                imageView.image = parent.selectedImage
//                imageView.contentMode = .scaleAspectFit
//                return imageView
//            }()
//            print("I am in image pick controller before line 365 ")
//            guard let cgImage = imageView.image?.cgImage else {
//                fatalError("could not get cg image")
//            }
//            let handler = VNImageRequestHandler(cgImage: cgImage, options:[:])
//            print("I am in image pick controller before line 369 ")
//            // Request
//            let request = VNRecognizeTextRequest { [weak self] request, error in
//                guard let observations = request.results as? [VNRecognizedTextObservation],
//                      error == nil else {
//                    return
//                }
//
//                print("observations:", observations)
//
//
//                let text = observations.compactMap({
//                    $0.topCandidates(1).first?.string
//                }).joined(separator: ", ")
//
//                print("text: ", text)
//                let x = text.split(separator: ",")
//
//                for ind in x.indices {
//                    if x[ind] == " TOTAL" {
//                        print(x[0].replacingOccurrences(of: " '", with: " "),x[ind+1])
//                    }
//                }
//            }
//
            
        }

    }
}


struct NewExpense_Previews: PreviewProvider {
    static var previews: some View {
        NewExpense()
            .environmentObject(ExpenseViewModel())
    }
}

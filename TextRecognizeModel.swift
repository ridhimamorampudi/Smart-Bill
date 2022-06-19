//
//  TextRecognizeModel.swift
//  ReceiptLogger4.0
//
//  Created by Ridhima on 6/19/22.
//


import Vision
import UIKit

class TextRecognizeModel: UIViewController{
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .red
        label.text = "Starting..."
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "receipt-ocr-original.jpg")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(imageView)
        
        recognizeText(image: imageView.image)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 20,
                                 y: view.safeAreaInsets.top,
                                 width: view.frame.size.width-40,
                                 height:view.frame.size.width-40)
        label.frame = CGRect(x: 20,
                             y: view.frame.size.width + view.safeAreaInsets.top,
                             width: view.frame.size.width-40,
                             height:200)
    }
    
    private func recognizeText(image: UIImage?){
        guard let cgImage = image?.cgImage else {
            fatalError("could not get cg image")
        }
        
        // Handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options:[:])
        
        // Request
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                return
            }
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: ", ")
            
            DispatchQueue.main.async {
                self?.label.text = text
                let x = text.split(separator: ",")
//                var item = Array<String>()
//                var itemcost = Array<String>()
//                print(x)
//                print(type(of: x))
                
                for ind in x.indices {
                    if x[ind] == " TOTAL" {
                        print(x[0].replacingOccurrences(of: " '", with: " "),x[ind+1])
                    }
                }
//                for (index, element) in x.enumerated() {
//
//                    print("Item \(index): \(element)")
////
//                    if element == " TOTAL" {
//                        print("Item \(index+1): \(element)")
//                        print(x[index])
//                    }
//                }
                
//                    print(i))
//                    break
                
//                print(text.split(separator: ",").suffix(from: 8))
                
                
//                print(type(of: text))
                
            }
        }
        
        // Process request
        do{
            try handler.perform([request])
            print("trying")
        }
        catch{
            label.text = "\(error)"
        }
    }
    
}



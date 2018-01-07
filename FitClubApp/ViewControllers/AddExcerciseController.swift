//
//  AddExcerciseController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 01/12/2017.
//  Copyright © 2017 Niels De bruyne. All rights reserved.
//

import UIKit
import Alamofire
import Toucan
import RealmSwift

class AddExcerciseController: UIViewController, UINavigationControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var txtExcercise: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var btnKiesFoto: UIButton!
    @IBOutlet weak var gekozenFoto: UIImageView!
    @IBOutlet weak var spiergroepPickerView: UIPickerView!
    
    let realm = try! Realm()
    var imageLink: String = ""
    var image: UIImage?
    var path: String?
    var exercise: Oefening?
    var muscle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        muscle = realm.objects(Spiergroep.self)[0].naam
        txtDescription!.layer.borderWidth = 0.5
        txtDescription!.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        txtDescription!.layer.cornerRadius = 5
        txtDescription!.clipsToBounds = true
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showAllExercises" && self.imageLink != "" {
            return true
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if imageLink != "" {
            let excercise = txtExcercise.text
            let description = txtDescription.text
            let image = self.imageLink
            
            self.exercise = Oefening(naam: excercise!, aantal: "5", oefeningDescription: description!, image: image)
        }
        
    }
    
    //wordt niet gebruikt
    @IBAction func addExcercise() {
        if txtExcercise.text != nil && txtDescription.text != nil && muscle != "" && muscle != nil && gekozenFoto != nil {
            
            performSegue(withIdentifier: "showAllExercises", sender: self)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return realm.objects(Spiergroep.self).count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == spiergroepPickerView {
            return realm.objects(Spiergroep.self)[row].naam
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == spiergroepPickerView {
            muscle = realm.objects(Spiergroep.self)[row].naam
        }
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let image = UIImagePickerController()
        
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true) {}
    }
    
    @IBAction func openCameraButton(sender: Any) {
        let image = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.camera;
            image.allowsEditing = false
            self.present(image, animated: true) {}
        }
    }
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            gekozenFoto.contentMode = .scaleAspectFill
            gekozenFoto.image = image
            self.image = image
            
            let resisedImage = Toucan.Resize.resizeImage(gekozenFoto.image!, size: CGSize(width: 400, height: 400))

            post(image: resisedImage!, for: txtExcercise.text!)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func post(image: UIImage, for oefening: String) {
        
        let imageData = UIImagePNGRepresentation(image)
        let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
        
        let url = "https://api.imgur.com/3/upload"
        
        let parameters = [
            "image": base64Image
        ]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            if let imageData = UIImageJPEGRepresentation(image, 1) {
                multipartFormData.append(imageData, withName: oefening, fileName: "\(oefening).png", mimeType: "image/png")
            }
            
            for (key, value) in parameters {
                multipartFormData.append((value?.data(using: .utf8))!, withName: key)
            }}, to: url, method: .post, headers: ["Authorization": "Client-ID 84fcdad812c32ee"],
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.response { response in
                            let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any]
                            print(json!)
                            let imageDic = json?["data"] as? [String:Any]
                            print("De link is \(String(describing: imageDic?["link"]!))")
                            self.imageLink = imageDic?["link"] as! String

                            print("De opgeslagen links is: \(self.imageLink)")
                        }
                    case .failure(let encodingError):
                        print("error:\(encodingError)")
                    }
        })
        
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

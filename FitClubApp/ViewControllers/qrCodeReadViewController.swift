//
//  qrCodeShowViewController.swift
//  FitClubApp
//
//  Created by Niels De bruyne on 07/01/2018.
//  Copyright © 2018 Niels De bruyne. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift

class qrCodeReadViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    var video = AVCaptureVideoPreviewLayer()
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkQrCode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkQrCode() {
        let session = AVCaptureSession()
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch {
            print("Error in qr code scannen")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count != 0 {
            // Get the metadata object.
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if metadataObj.type == AVMetadataObject.ObjectType.qr {
                let alert = UIAlertController(title: "QR CODE", message: "Do you want to add \(String(describing: metadataObj.stringValue)) to your muscle collection?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: {action in
                    self.dismiss(animated: true, completion: nil)
                }))
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(nil) in
                    let spiergroep = Spiergroep(naam: metadataObj.stringValue!)
                    try! self.realm.write {
                        self.realm.add(spiergroep)
                    }
                    self.dismiss(animated: true, completion: nil)
                }))
                
                present(alert, animated: true, completion: nil)
            }
        }
    }

}

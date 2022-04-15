//
//  ImagePickerController.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/9/21.
//
enum imagePickerMode {
    case photo
    case document
    case all
}

import Foundation
import MobileCoreServices
class CorePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIDocumentPickerDelegate {
    static var shared = CorePickerManager()
    var picker = UIImagePickerController();
    var mode:imagePickerMode?
    var alert = UIAlertController(title: "Choose Method", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage?,URL?) -> ())?
    
    override init(){
        super.init()
        
        picker.delegate = self
        
    }
    
    func modeChanger(){
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let uploadDocument = UIAlertAction(title: "Pdf file", style: .default){
            UIAlertAction in
            self.uploadDoucument()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        guard let mode = mode else { return }
        if mode == .photo {
            alert.addAction(cameraAction)
            alert.addAction(galleryAction)
            alert.addAction(cancelAction)
        }else if mode == .all {
            alert.addAction(cameraAction)
            alert.addAction(galleryAction)
            alert.addAction(uploadDocument)
            alert.addAction(cancelAction)
        }else if mode == .document {
            alert.addAction(uploadDocument)
            alert.addAction(cancelAction)
            
        }
    }
    
    func pickFile(_ viewController: UIViewController, _ callback: @escaping ((UIImage? ,URL?) -> ())) {
        pickImageCallback = callback
        self.viewController = viewController;
        modeChanger()
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        
        viewController.present(alert, animated: true, completion: nil)
    }
    func uploadDoucument() {
        alert.dismiss(animated: true, completion: nil)
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        viewController?.present(importMenu, animated: true, completion: nil)
    }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController){
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    public func documentMenu(_ documentMenu:UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController){
        documentPicker.delegate = self
        viewController?.present(documentPicker, animated: true, completion: nil)
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        pickImageCallback?(nil,myURL)
        
    }
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            let alertController: UIAlertController = {
                let controller = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                controller.addAction(action)
                return controller
            }()
            viewController?.present(alertController, animated: true)
        }
    }
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        viewController?.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image,nil)
    }
    
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }
    
}

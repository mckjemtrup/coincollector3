//
//  AddCoinViewController.swift
//  CoinCollecter3
//
//  Created by Michael Kjemtrup on 01/03/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class AddCoinViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addUpdateButton: UIButton!
    @IBOutlet weak var imageviewer: UIImageView!
    @IBOutlet weak var textBox: UITextField!
    
    var imagePicker = UIImagePickerController()
    var coin : Coins? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if coin != nil {
            imageviewer.image = UIImage(data: coin!.image as! Data )
            textBox.text = coin!.title
            addUpdateButton.setTitle("Update", for: .normal )
        } else {
            deleteButton.isHidden = true 
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageviewer.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func addCoinTapped(_ sender: Any) {
        
        if coin != nil {
            
            coin!.title = textBox.text
            coin!.image = UIImagePNGRepresentation(imageviewer.image!)! as NSData
            
        } else {
            let contexting = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let addCoin = Coins(context: contexting)
            
            addCoin.title = textBox.text
            addCoin.image = UIImagePNGRepresentation(imageviewer.image!)! as NSData
            
        }
            
        
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController! .popViewController(animated: true)
        
        
    }
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
       
         let contexting = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        contexting.delete(coin!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController! .popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//
//  AddCoinViewController.swift
//  CoinCollecter3
//
//  Created by Michael Kjemtrup on 01/03/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class AddCoinViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageviewer: UIImageView!
    @IBOutlet weak var textBox: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self 
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
    }
    
    
    @IBAction func addCoinTapped(_ sender: Any) {
        
       let contexting = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let addCoin = Coins(context: contexting)
        
        addCoin.title = textBox.text
        addCoin.image = UIImagePNGRepresentation(imageviewer.image!)! as NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//
//  DetailViewController.swift
//  To Do List
//
//  Created by CSOM on 2/12/17.
//  Copyright © 2017 CSOM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        toDoField.text = toDoItem
        toDoField.delegate = self
        toDoField.becomeFirstResponder()
        
        if toDoItem?.characters.count == 0 || toDoItem == nil{
            saveBarButton.isEnabled = false
        } else {
            saveBarButton.isEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Mark:- UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // if this was called because the user is typing in the toDoField
        if textField == toDoField {
            //grab text before typing
            let oldString = textField.text! as NSString
            // find out what the new string will look like after typing
            let newString = oldString.replacingCharacters(in: range, with: string) as NSString
            //if after the typing the new string has nothin in it, disable the save button
            if newString.length == 0 {
                saveBarButton.isEnabled = false
            } else {
                saveBarButton.isEnabled = true
            }
        }
        return true
    }
    
    //Mark:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveBarButton == sender as! UIBarButtonItem {
            toDoItem = toDoField.text
        }
    }


    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
        let isPresentingInAddMode = presentingViewController is
        UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
            
        }else {
            navigationController!.popViewController(animated: true)
        }
    }
}


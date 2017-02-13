//
//  DetailViewController.swift
//  To Do List
//
//  Created by CSOM on 2/12/17.
//  Copyright © 2017 CSOM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        toDoField.text = toDoItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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


//
//  ViewController.swift
//  Core Data
//
//  Created by Mac on 31/07/20.
//  Copyright © 2020 Gunde Ramakrishna Goud. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var dataSourceArr = [DataModel]()
    let appDelegete = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        featchAndUpdateTable()
    }
    
    
    // FETCHED DATA IS SHOWING IN TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let person = dataSourceArr[indexPath.row]
        cell.Sname.text = person.name
        cell.SEmail.text = person.email
        cell.SmobileNo.text = person.mobileNo
        cell.Saddress.text = person.address
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    //CELL DATA IS UPDATING PROCESS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let person = dataSourceArr[indexPath.row]
                     var nameTF: UITextField?
                     var emailTF: UITextField?
                     var mobileNoTF: UITextField?
                     var addressTF: UITextField?
               let alertMessage = UIAlertController(title: "Alert Title", message: "Please UPDATE Name,Email,MobileNo and Address", preferredStyle: .alert)
               let ok = UIAlertAction(title: "UPDATE", style: .default, handler: { (action) -> Void in
                   let name = nameTF?.text
                    let email = emailTF?.text
                    let mobileNo = mobileNoTF?.text
                    let address = addressTF?.text
                   if name != nil && email != nil && mobileNo != nil && address != nil
                   {
                       self.appDelegete.updateData(student: person, name: name!, email: email!, mobileNo: mobileNo!, address: address!)
                       self.featchAndUpdateTable()
                       
                       
                   }
               })
               // creating Cancel button with action handler
               let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                   print("Cancel button tapped")
               }
               //add ok and cancel button to alert message
               alertMessage.addAction(ok)
               alertMessage.addAction(cancel)
               
               //Add Input Textfeilds to alert message
               alertMessage.addTextField { (textField) -> Void in
                   nameTF = textField
                   nameTF?.placeholder = "Enter Your Name"
                   nameTF?.text = person.name
                   
               }
               alertMessage.addTextField { (textField) -> Void in
                   emailTF = textField
                   emailTF?.placeholder = "Enter Your EMail"
                   emailTF?.text = person.email
                   
               }
               alertMessage.addTextField { (textField) -> Void in
                   mobileNoTF = textField
                   mobileNoTF?.placeholder = "Enter Your valid Mobile No"
                   mobileNoTF?.text = person.mobileNo
                   
               }
               alertMessage.addTextField { (textField) -> Void in
                   addressTF = textField
                   addressTF?.placeholder = "Enter Your Address"
                   addressTF?.text = person.address
                   
               }
               self.present(alertMessage, animated: true, completion: nil)
           }
       
    // CELL DATA IS DELETED PROCESS
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete
           {
                let person = dataSourceArr[indexPath.row]
               appDelegete.deleteData(student: person)
               featchAndUpdateTable()
               
           }
       }
       
    func featchAndUpdateTable()
    {
        dataSourceArr = appDelegete.featchData()
        tableView.reloadData()
    }
    @IBAction func onSaveBtn(_ sender: UIButton)
    {
        var nameTF: UITextField?
        var emailTF: UITextField?
        var mobileNoTF: UITextField?
        var addressTF: UITextField?
        let alertMessage = UIAlertController(title: "Alert Title", message: "Please provide Name,Email,MobileNo and Address", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                let name = nameTF?.text
                 let email = emailTF?.text
                 let mobileNo = mobileNoTF?.text
                 let address = addressTF?.text
        if name != nil && email != nil && mobileNo != nil && address != nil
        {
            self.appDelegete.insertData(name: name!, email: email!, mobileNo: mobileNo!, address: address!)
            self.featchAndUpdateTable()
                    
                    
        }
            })
            // creating Cancel button with action handler
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel button tapped")
            }
            //add ok and cancel button to alert message
            alertMessage.addAction(ok)
            alertMessage.addAction(cancel)
            
            //Add Input Textfeilds to alert message
            alertMessage.addTextField { (textField) -> Void in
                nameTF = textField
                nameTF?.placeholder = "Enter Your Name"
                
            }
            alertMessage.addTextField { (textField) -> Void in
                emailTF = textField
                emailTF?.placeholder = "Enter Your EMail"
                
            }
            alertMessage.addTextField { (textField) -> Void in
                mobileNoTF = textField
                mobileNoTF?.placeholder = "Enter Your valid Mobile No"
                
            }
            alertMessage.addTextField { (textField) -> Void in
                addressTF = textField
                addressTF?.placeholder = "Enter Your Address"
                
            }
            self.present(alertMessage, animated: true, completion: nil)
        }
    }
    



//
//  FMS_DriverProfileVC.swift
//  FMS
//
//  Created by indianic on 16/09/15.
//  Copyright © 2015 indianic. All rights reserved.
//

import UIKit

class FMS_DriverProfileVC: UIViewController {

    @IBOutlet weak var txtfld_DriverName: UITextField!
    @IBOutlet weak var txtfld_Email: UITextField!
    @IBOutlet weak var txtfld_ContactNo: UITextField!
    @IBOutlet weak var txtfld_EmergencyCNo: UITextField!
    @IBOutlet weak var txtfld_DOB: CustomTextField!
    @IBOutlet weak var txtfld_Address: UITextField!
    @IBOutlet weak var btnYesSeePrice: DLRadioButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnNoSeePrice: DLRadioButton!
    @IBOutlet weak var scrVWContainer: TPKeyboardAvoidingScrollView!
    @IBOutlet weak var btnMale: DLRadioButton!
    @IBOutlet weak var btnFemale: DLRadioButton!
    @IBOutlet weak var btnNoAcptLoad: DLRadioButton!
    @IBOutlet weak var btnYesAcptLoad: DLRadioButton!
    @IBOutlet weak var btnStatusActive: DLRadioButton!
    @IBOutlet weak var btnStatusSuspend: DLRadioButton!
    
    @IBOutlet weak var lblAcceptLoadTitle: UILabel!
    @IBOutlet weak var lblSeeFreightTitle: UILabel!
    @IBOutlet weak var vwStatus: UIView!
    @IBOutlet weak var vwAddress: UIView!
    
    // 0 =  create new driver ,  1 = edit driver
    var intUsageType : NSInteger = 0
    var strDriverID : String!
    var dictDriverDetail : [String : AnyObject]!
    
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        scrVWContainer.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
       
        if let title = FMS_Utility .sharedFMS().dictPermissions?["accept_load"] as? String
        {
            lblAcceptLoadTitle.text = title;
        }
        else
        {
            lblAcceptLoadTitle.text = "Can accept load?"
        }
        
        if let title = FMS_Utility .sharedFMS().dictPermissions?["view_rate"] as? String
        {
            lblSeeFreightTitle.text = title;
        }
        else
        {
            lblSeeFreightTitle.text = "Can see freight, total earning and rate?"
        }
        
        
       // lblAcceptLoadTitle.text = FMS_Utility .sharedFMSUtility().dictPermissions["accept_load"] as? String
        //lblSeeFreightTitle.text = FMS_Utility .sharedFMSUtility().dictPermissions["view_rate"] as? String
        
        
        FMS_Utility.sharedFMS().addPicker(self, on: txtfld_DOB, pickerType: "Date", withKey: "", withCompletionBlock: { (picker, buttonIndex, firtIndex, secondIndex) -> Void in
            
            self.txtfld_DOB .resignFirstResponder()
            if(buttonIndex==1)
            {
                let datePickerObj = picker as! UIDatePicker
                FMS_Utility.sharedFMS().dateFormatterObj.dateFormat = "dd MMM,yyyy"
                self.txtfld_DOB.text = FMS_Utility.sharedFMS().dateFormatterObj.string(from: datePickerObj.date);
            }
            
            }, withPickerArray: nil, withPickerSecondArray: nil, count: 0, withTitle:"")

        
        if(intUsageType == 0)
        {
            btnAdd.setTitle("Add", for:UIControlState.normal)
            self.setNavigationBarWithTitle("Create Driver", withBack: true)
            
            btnYesAcptLoad.isSelected = true;
            btnYesSeePrice.isSelected = true;
            btnStatusActive.isSelected = true;
            btnMale.isSelected = true;
            
            vwStatus.isHidden = true;
            vwAddress.frame = vwStatus.frame;
            btnAdd.frame.origin.y = vwStatus.frame.origin.y + vwStatus.frame.size.height+34
            
            
            
        }
        else
        {
            btnAdd.setTitle("Update", for:UIControlState.normal)
            self.setNavigationBarWithTitle("Driver profile", withBack: true)
            callWSForDetail();
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Orientation
    
    // MARK: - Events
    @IBAction func btnAddClicked(sender: UIButton)
    {
        callWSCreateUpdate()
    }
    
    // MARK: - OtherMethods
    
    // MARK: - ViewTouch
    
    func setUpLayout()
    {
        

        
        txtfld_Address.text = self.dictDriverDetail["address"] as? String
        txtfld_ContactNo.text = self.dictDriverDetail["contact_number"] as? String
        txtfld_DOB.text = self.dictDriverDetail["date_of_birth"] as? String
        txtfld_DriverName.text = self.dictDriverDetail["driver_name"] as? String
        txtfld_Email.text = self.dictDriverDetail["email"] as? String
        txtfld_EmergencyCNo.text = self.dictDriverDetail["emergency_contact_number"] as? String
        
        if(self.dictDriverDetail["gender"] as? String == "Male")
        {
            btnMale.isSelected = true;
        }
        else
        {
            btnFemale.isSelected = true;
        }

        if(self.dictDriverDetail["status"] as? String == "Active")
        {
            btnStatusActive.isSelected = true;
        }
        else
        {
            btnStatusSuspend.isSelected = true;
        }
        
        
        if let aArrPermission : Array<String> = self.dictDriverDetail["permission"] as? Array
        {
            
            if(aArrPermission.contains("view_rate"))
            {
                btnYesSeePrice.isSelected = true;
            }
            else
            {
                btnNoSeePrice.isSelected = true;
            }
            
            
            if(aArrPermission.contains("accept_load"))
            {
                btnYesAcptLoad.isSelected = true;
            }
            else
            {
                btnNoAcptLoad.isSelected = true;
            }

            
            print("have array")
        }
        else
        {
            
            btnNoSeePrice.isSelected = true;
            btnNoAcptLoad.isSelected = true;
            
        }

        
        
        
        
    }
    
    
    func callWSForDetail()
    {
        
        let WebserviceObj:Webservice = Webservice();
        
        let aStrUrl = "\(FMS_WSURL)/loads/driver_detail"
        
        let aStrToken = UserDefaults.standard.object(forKey: FMS_LoginUserToken) as! String
        let aStrType = UserDefaults.standard.object(forKey: FMS_LoginUserType) as! String
        
        
        let aDictObj : [NSObject:AnyObject?] = ["token" as NSObject:aStrToken as Optional<AnyObject>,"role" as NSObject:aStrType as Optional<AnyObject>,"driver_id" as NSObject:strDriverID as Optional<AnyObject>]
        
        print(aDictObj);
        
        WebserviceObj.call(withURL: aStrUrl, withSilentCall: false, withParams: aDictObj, for: self, withCompletionBlock: { (responseData) -> Void in
            
            if(responseData?["status"] as! NSNumber == 1)
            {
                var aArrData : Array <AnyObject> = responseData!["data"] as! Array;
                if(aArrData.count>0)
                {
                    self.dictDriverDetail  =  aArrData[0] as? Dictionary
                    self.setUpLayout()
                }
            }
            else
            {
                FMS_Utility.showAlert(responseData?["message"] as! String)
            }
            
            
            })
            { (error) -> Void in
                
        }
        
        
    }

    
    func callWSCreateUpdate()
    {
        
        //Check for compulsory fields
        if(FMS_Utility.isEmptyText(txtfld_DriverName.text))
        {
            FMS_Utility.showAlert("Driver name should not be blank.")
            return;
        }
        
        if(FMS_Utility.isEmptyText(txtfld_Email.text))
        {
            FMS_Utility.showAlert(EnterEmail)
            return;
        }
        
        if(!FMS_Utility.validateEmail(txtfld_Email.text))
        {
            FMS_Utility.showAlert(EnterValidEmail)
            return;
        }
        
        
        
        // process for DOB
        var dobToPass : String! = ""
        if(!FMS_Utility.isEmptyText(txtfld_DOB.text))
        {
            FMS_Utility.sharedFMS().dateFormatterObj.dateFormat = "dd MMM,yyyy"
            if let dateDOB = FMS_Utility.sharedFMS().dateFormatterObj.date(from: txtfld_DOB.text!)
            {
                FMS_Utility.sharedFMS().dateFormatterObj.dateFormat = "yyyy/MM/dd"
                dobToPass = FMS_Utility.sharedFMS().dateFormatterObj.string(from: dateDOB)

            }
        }
        
        

        // process for gender
        let strGender = btnMale.isSelected ? "Male":"Female"
        
        // process for status
        let strStatus = btnStatusActive.isSelected ? "Active":"Suspended"
        
        // process for permission
        var aMutArr : Array<String> = [];
        if(btnYesAcptLoad.isSelected)
        {
            aMutArr.append("accept_load")
        }
        if(btnYesSeePrice.isSelected)
        {
            aMutArr.append("view_rate")
        }
        
        var aStrArrData : String!
        do
        {
            let aDataObj = try JSONSerialization.data(withJSONObject: aMutArr, options:JSONSerialization.WritingOptions.prettyPrinted)
            aStrArrData = NSString(data: aDataObj, encoding:String.Encoding.utf8.rawValue)! as String
            
        }
        catch
        {
            // report error
        }
        //
        
        let aStrToken = UserDefaults.standard.object(forKey: FMS_LoginUserToken) as! String
    
        let aStrType = UserDefaults.standard.object(forKey: FMS_LoginUserType) as! String
        
        aStrArrData = aStrArrData.replacingOccurrences(of: "\n" , with:"");
        aStrArrData = aStrArrData.replacingOccurrences(of: " " , with:"");
        
        var aStrUrl = ""
        var aDictObj : [NSObject:AnyObject]!
        if(intUsageType == 0)
        {
            aStrUrl = "\(FMS_WSURL)/contractors/create_driver"

            
            
            aDictObj = ["token" as NSObject:aStrToken as AnyObject,
                        "role" as NSObject:aStrType as AnyObject,
                        "name" as NSObject:(txtfld_DriverName.text! as String as AnyObject),
                        "contact_number" as NSObject:(txtfld_ContactNo.text! as String as AnyObject),
                        "emergency_contact_number" as NSObject:(txtfld_EmergencyCNo.text! as String as AnyObject),
                        "email" as NSObject:(txtfld_Email.text! as String as AnyObject),
                        "address" as NSObject:(txtfld_Address.text! as String as AnyObject),
                        "date_of_birth" as NSObject:dobToPass as AnyObject,
                        "permission" as NSObject:aStrArrData as AnyObject,
                        "gender" as NSObject:strGender as AnyObject]
        }
        else
        {
            
            aStrUrl = "\(FMS_WSURL)/contractors/update_driver"
            
            aDictObj = ["driver_id" as NSObject:(strDriverID! as String as AnyObject),
                "token" as NSObject:aStrToken as AnyObject,
                "role" as NSObject:aStrType as AnyObject,
                "name" as NSObject:(txtfld_DriverName.text! as String as AnyObject),
                "contact_number" as NSObject:(txtfld_ContactNo.text! as String as AnyObject),
                "emergency_contact_number" as NSObject:(txtfld_EmergencyCNo.text! as String as AnyObject),
                "email" as NSObject:(txtfld_Email.text! as String as AnyObject),
                "address" as NSObject:(txtfld_Address.text! as String as AnyObject),
                "date_of_birth" as NSObject:dobToPass as AnyObject,
                "permission" as NSObject:aStrArrData as AnyObject,
                "gender" as NSObject:strGender as AnyObject,
                "status" as NSObject:strStatus as AnyObject]


        }
        
        let WebserviceObj:Webservice = Webservice();
        WebserviceObj.call(withURL: aStrUrl, withSilentCall: false, withParams: aDictObj, for: self, withCompletionBlock: { (responseData) -> Void in
            
            if(responseData?["status"] as! NSNumber == 1)
            {
                FMS_Utility .sharedFMS().showAlert(withTarget: self, withMessage: responseData?["message"] as! String, withCancelButton: "Ok", withCompletionBlock: { (buttonIndex) -> Void in
                    
                    self.navigationController?.popViewController(animated: true)
                    
                    
                    }, withOtherButtons:nil)
            }
            else
            {
                FMS_Utility.showAlert(responseData?["message"] as! String)
            }
            
            
            
            })
            { (error) -> Void in
                
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

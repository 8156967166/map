//  ViewController.swift
//  RegisterationForm
//  Created by Aneesha on 21/11/23.

import UIKit

class RegistrationViewController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var viewNameError: UIView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var viewEmailError: UIView!
    @IBOutlet weak var labelCode: UILabel!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var viewPhoneError: UIView!
    @IBOutlet weak var textViewAddress: UITextView!
    @IBOutlet weak var viewAddressError: UIView!
    @IBOutlet weak var labelSelectedPic: UILabel!
    @IBOutlet weak var viewProfilePicError: UIView!
    @IBOutlet weak var textFieldDateOfBirth: UITextField!
    @IBOutlet weak var viewDateOfBirthError: UIView!
    @IBOutlet weak var labelSelectedGender: UILabel!
    @IBOutlet weak var imageDropDown: UIImageView!
    @IBOutlet weak var viewGenderError: UIView!
    @IBOutlet weak var textFieldPan: UITextField!
    @IBOutlet weak var viewPanError: UIView!
    @IBOutlet weak var textfieldAadhar: UITextField!
    @IBOutlet weak var viewAadharError: UIView!
    
    //MARK: Variables
    
    var dateCmpnt = DateComponents()
    var calendarView = UICalendarView()
    var CalenderPopup: Calender!
    
    //MARK: LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenView()
        textFieldDelegates()
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegistrationViewController.tapFunction))
        textFieldDateOfBirth.isUserInteractionEnabled = true
        textFieldDateOfBirth.addGestureRecognizer(tap)
    }
    
    //MARK: Functions
    
    func hiddenView() {
        viewNameError.isHidden = true
        viewEmailError.isHidden = true
        viewPhoneError.isHidden = true
        viewAddressError.isHidden = true
        viewProfilePicError.isHidden = true
        viewDateOfBirthError.isHidden = true
        viewGenderError.isHidden = true
        viewPanError.isHidden = true
        viewAadharError.isHidden = true
    }
    
    func textFieldDelegates() {
        textFieldName.delegate = self
        textFieldEmail.delegate = self
        textFieldPhone.delegate = self
        textViewAddress.delegate = self
        textFieldDateOfBirth.delegate = self
        textFieldPan.delegate = self
        textfieldAadhar.delegate = self
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
    }
}

//MARK: TextFieldDelegates

extension RegistrationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldName {
            let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        }
        if textField == textFieldEmail {
            let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-.@"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        }
        if textField == textFieldPhone {
            let allowedCharacters = "0123456789"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            let maxLength = 10
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            let isWithinMaxLength = newText.count <= 10
            
            return alphabet && isWithinMaxLength
        }
        if textField == textViewAddress {
            let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,#-./ "
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        }
        
       return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        view.endEditing(true)
        return true
    }
}

//MARK: TextViewDelegates

extension RegistrationViewController: UITextViewDelegate {
    
}

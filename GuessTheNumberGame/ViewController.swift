//
//  ViewController.swift
//  GuessTheNumberGame
//
//  Created by UMUT GUDUL on 3.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNumberToGuess: UITextField!
    @IBOutlet weak var imgSave: UIImageView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtGuessedNumber: UITextField!
    @IBOutlet weak var imgGuessState: UIImageView!
    @IBOutlet weak var btnTry: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgStar1: UIImageView!
    @IBOutlet weak var imgStar2: UIImageView!
    @IBOutlet weak var imgStar3: UIImageView!
    @IBOutlet weak var imgStar4: UIImageView!
    @IBOutlet weak var imgStar5: UIImageView!
    var stars : [UIImageView] = [UIImageView]()
    let maxNumberOfAttempts : Int = 5
    var numberOfAttempts : Int = 0
    var targetNumber : Int = -1
    var gameSuccessful : Bool = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        stars = [imgStar1, imgStar2, imgStar3, imgStar4, imgStar5]
        imgSave.isHidden = true
        imgGuessState.isHidden = true
        btnTry.isEnabled = false
        txtNumberToGuess.isSecureTextEntry = true
        lblResult.text = ""
        
    }
    
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        imgSave.isHidden = false
        if let t = Int(txtNumberToGuess.text!) {
            targetNumber = t
            btnTry.isEnabled = true
            txtNumberToGuess.isEnabled = false
            btnSave.isEnabled = false
            imgSave.image = UIImage(named: "onay")
        } else {
            imgSave.image = UIImage(named: "hata")
        }
    }
    
    
    @IBAction func btnTryClicked(_ sender: UIButton) {
        if gameSuccessful == true || numberOfAttempts > maxNumberOfAttempts {
            return // don't run the code below and return void
        }
        imgGuessState.isHidden = false
        if let enteredNumber = Int(txtGuessedNumber.text!){
            numberOfAttempts += 1
            stars[numberOfAttempts-1].image = UIImage(named: "beyazYildiz")
                        if enteredNumber > targetNumber {
                imgGuessState.image = UIImage(named: "asagi")
                txtGuessedNumber.backgroundColor = UIColor.red
            } else if enteredNumber < targetNumber {
                imgGuessState.image = UIImage(named: "yukari")
                txtGuessedNumber.backgroundColor = UIColor.red
            } else {
                imgGuessState.image = UIImage(named: "tamam")
                btnSave.isEnabled = true
                lblResult.text = "Doğru Tahmin!!!"
                txtGuessedNumber.backgroundColor = UIColor.green
                txtNumberToGuess.isSecureTextEntry = false
                gameSuccessful = true
                let alertController = UIAlertController(title: "Başarılı", message: "Sayıyı Doğru Tahmin Ettin. Tebrikler!", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return
            }
            
        } else {
           
            imgGuessState.image = UIImage(named: "hata")
            
        }
        
        if numberOfAttempts == maxNumberOfAttempts {
            btnTry.isEnabled = false
            imgGuessState.image = UIImage(named: "hata")
            lblResult.text = "Oyun Başarısız \nArkadaşın \(targetNumber) Sayısını Girmişti"
            txtNumberToGuess.isSecureTextEntry = false
            let alertController = UIAlertController(title: "Üzgünüm", message: "Tahmin Hakkın Bitti. Tahmin Etmen Gereken Sayı : \(targetNumber)", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
            
        }
        
    }
    
    
    


}


//
//  ViewController.swift
//  myCalc
//
//  Created by Алёнка on 5.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    var numberForScreen:Double = 0
    var prev:Double = 0
    var option:Int = 0
    var isOption:Bool = false
    func isInt(result:Double) -> Bool{
        if(result.truncatingRemainder(dividingBy: 1) != 0){
             return false
        }else {return true}
    }
    @IBOutlet weak var result: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        if isOption{
            result.text = String(sender.tag)
            numberForScreen = Double(result.text!)!
            isOption = false
        } else{
            result.text = result.text! + String(sender.tag)
            numberForScreen = Double(result.text!)!
        }
    }
    @IBAction func changes(_ sender: UIButton) {
        if result.text != ""{
            if sender.tag == 16{
                numberForScreen = -numberForScreen
                result.text = isInt(result:numberForScreen) ? String(Int(numberForScreen)) : String(numberForScreen)
            }
            if sender.tag == 17{
                numberForScreen = 0.01 *  numberForScreen
                result.text = String(numberForScreen)
            }
        }
    }
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != ""{
            switch sender.tag{
            case 10:
                result.text = ""
                numberForScreen = 0
                prev = 0
                option = 0
                isOption = false
                break
            case 11...14:
                prev = numberForScreen
                isOption = true
                option = sender.tag
                break
            case 15:
                if option == 11{
                    result.text = isInt(result: prev/numberForScreen) ? String(Int(prev/numberForScreen)): String(prev/numberForScreen)
                }else if option == 12{
                    result.text = isInt(result: prev*numberForScreen) ? String(Int(prev*numberForScreen)): String(prev*numberForScreen)
                }else if option == 13{
                    result.text = isInt(result: prev-numberForScreen) ? String(Int(prev-numberForScreen)): String(prev-numberForScreen)
                } else if option == 14{
                    result.text = isInt(result: prev+numberForScreen) ? String(Int(prev+numberForScreen)): String(prev+numberForScreen)
                }
                break
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  ViewController.swift
//  Buoi9-UserDefault
//
//  Created by lynnguyen on 17/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // quản trị các biến users
    // trả về 1 mã số ở màn hình gốc - gọi là TOKEN
    // Ios - làm sao lưu trữ biến đó - tắt nguồn, tắt máy vẫn vào bth k cần đăng nhập => TOKEN đã lưu trữ trong máy
    // dùng DB local - core DATA - quá phức tạp, nặng app, không thể lấy DB để chứa TOKEN - lãng phí
    // or SQLITE - k bảo mật - file ai đó detect thì có thể lấy dc thông tin
    // => sử dụng biến đặc biệt, tắt app vần còn lưu lại == UserDefaultsl
    
    // quản trị các biến lưu trên thiết bị users
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var txt: UITextField!
    @IBOutlet weak var lbl: UILabel!
    var arrColor: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrColor = ["yellow", "red", "orange"]
        if let textLbl = defaults.string(forKey: "LOGIN") {
            lbl.text = textLbl
            
            if lbl.text == arrColor[0] {
                view.backgroundColor = .yellow
            }
            if lbl.text == arrColor[1] {
                view.backgroundColor = .red
            }
            if lbl.text == arrColor[2] {
                view.backgroundColor = .orange
            }
            
            
        } else {
            lbl.text = "Not exists"
        }
    }
    
    // bấm save lưu trong phần cứng của máy
    @IBAction func clickSave(_ sender: Any) {
        let sData = txt.text!
        // gán giá trị - giá trị và tên biến
        defaults.setValue(sData, forKey: "LOGIN")
        
    }
    
}


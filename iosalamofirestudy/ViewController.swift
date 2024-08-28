//
//  ViewController.swift
//  iosalamofirestudy
//
//  Created by kenan on 27.08.2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //insertUser()
        //deleteUser()
        getAllUsers()
        searchUser()
    }
    
    func insertUser(){
        let params:Parameters = ["kisi_ad":"Kenan","kisi_tel":"111111"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post,parameters: params).responseJSON{ response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data,options: []) as? [String:Any]{
                        print(json)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteUser(){
        let params:Parameters = ["kisi_id":17633]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post,parameters: params).responseJSON{ response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data,options: []) as? [String:Any]{
                        print(json)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func updateUser(){
        let parametreler:Parameters = ["kisi_id":121,"kisi_ad":"XXXXXXX","kisi_tel":"X8X8X8"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post,parameters: parametreler).responseJSON { response in
            
            if let data  = response.data {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    
    func getAllUsers(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).responseJSON {
            response in
            
            if let data  = response.data {
                
                do {
                    
                    let cevap = try JSONDecoder().decode(UserResponse.self, from: data)
                    
                    if let kisiListesi = cevap.users {
                        
                        for kisi in kisiListesi {
                            
                            print("Kisi id  : \(kisi.user_id!)")
                            print("Kisi ad  : \(kisi.user_name!)")
                            print("Kisi tel : \(kisi.user_phone!)")
 
                        }
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
    }
    
    func searchUser(){
        
        let parametreler:Parameters = ["kisi_ad":"Veli"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post,parameters: parametreler).responseJSON { response in
            
            if let data  = response.data {
                
                do {
                    
                    let cevap = try JSONDecoder().decode(UserResponse.self, from: data)
                    
                    if let kisiListesi = cevap.users {
                        
                        for kisi in kisiListesi {
                            
                            print("Kisi id  : \(kisi.user_id!)")
                            print("Kisi ad  : \(kisi.user_name!)")
                            print("Kisi tel : \(kisi.user_phone!)")
                            
                        }
                        
                    }
                   
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }


}


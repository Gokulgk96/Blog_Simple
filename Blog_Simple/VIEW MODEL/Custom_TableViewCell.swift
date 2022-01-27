//
//  Custom_TableViewCell.swift
//  Blog_Simple
//
//  Created by Gokul Gopalakrishnan on 26/01/22.
//

import UIKit

class Custom_TableViewCell: UITableViewCell {
   
    @IBOutlet weak var Table_cell: UIView!
    
    @IBOutlet weak var Image_work: UIImageView!
    
    @IBOutlet weak var Label_work: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    func set(Image_string: String, Label_works: String, Desc : String)
    {
        Label_work.text = Label_works
        
        if (Desc != "")
        {
        Description.attributedText = Desc.htmlToAttributedString
        }
        
        let link = URL(string: Image_string)
        
        DispatchQueue.global().async {
            
            if let imagedata = try? Data(contentsOf: link!)
            {
                DispatchQueue.main.async {
                    self.Image_work.image = UIImage(data: imagedata)
                                         }
            }
        }
        Image_work.layer.cornerRadius = 15
        Image_work.clipsToBounds = true
        Image_work.layer.borderWidth = 5
        Image_work.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
        Image_work.translatesAutoresizingMaskIntoConstraints = false
        
        Image_work.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        Image_work.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
      
        Image_work.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
  //      Image_work.bottomAnchor.constraint(equalTo: Label_work.topAnchor).isActive = true
 
        
    }
    
  
}
   

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
    
   



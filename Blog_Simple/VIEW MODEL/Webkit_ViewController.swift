//
//  Webkit_ViewController.swift
//  Blog_Simple
//
//  Created by Gokul Gopalakrishnan on 27/01/22.
//

import UIKit
import WebKit

class Webkit_ViewController: UIViewController {

    @IBOutlet weak var Webkit_work: WKWebView!
    
    var index_number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Webkit_work.loadHTMLString(apicaller.articles[index_number].body_html, baseURL: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

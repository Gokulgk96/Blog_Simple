//
//  ViewController.swift
//  Blog_Simple
//
//  Created by Gokul Gopalakrishnan on 26/01/22.
//

import UIKit

var apicaller : articles = articles(articles: [])

class ViewController: UIViewController {

    @IBOutlet weak var Table_View_model: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = "Blog_Simple"
        
        Table_View_model.rowHeight = UITableView.automaticDimension
        
        JsonDownloader{
             
         
            self.Table_View_model.reloadData()
            
        }
   
    }
    

    func JsonDownloader(completed: @escaping () -> ())
    {
            
    let url = URL(string: "https://run.mocky.io/v3/cdc1c53e-2825-4162-826d-b8294e477934")!


      let task = URLSession.shared.dataTask(with: url)
                {
                    data, response, error in
                    
                    if let data = data
                    {
                        do
                        {
                            apicaller = try JSONDecoder().decode(articles.self, from: data)
                          
                            DispatchQueue.main.async {
                                completed()
                            }
                        }catch
                        {
                            print("Error")
                            print(error.localizedDescription)
                        }
                    }
                }
                task.resume()
         
    }
    
    func pushtoselectedviewcontroller(table_index: Int)
    {
        guard let vc = storyboard?.instantiateViewController(identifier: "Webkit_ViewController") as? Webkit_ViewController
        else
        {
            return
        }
        
        vc.index_number = table_index
       
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}



extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let link = URL(string: apicaller.articles[indexPath.row].image.src)
        
        if let imagedata = try? Data(contentsOf: link!)
        {
        
            if let current_image = UIImage(data: imagedata)?.getCropRatio()
                   {
                    return Table_View_model.frame.width / current_image + 50
                   }
        }
        return 0
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        pushtoselectedviewcontroller(table_index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apicaller.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom_Tableview_cell", for: indexPath) as! Custom_TableViewCell
       
        cell.set(Image_string: apicaller.articles[indexPath.row].image.src,Label_works: apicaller.articles[indexPath.row].title,Desc: apicaller.articles[indexPath.row].summary_html)
        
        return cell
    }

    
}

extension UIImage
{
    func getCropRatio() -> CGFloat
    {
        let widthratio = CGFloat(self.size.width / self.size.height)
        return widthratio
    }
}

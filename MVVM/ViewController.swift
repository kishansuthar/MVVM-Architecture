//
//  ViewController.swift
//  MVVM
//
//  Created by Kishan Suthar on 07/06/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,ViewModelDelegate {

    @IBOutlet weak var tblMovieList: UITableView!
        var viewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Movie List"
        viewModel.delegate = self
        viewModel.getPopularMovieList()
    }
    
    func reloadTable() {
       
            self.tblMovieList.reloadData()
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMovieList.dequeueReusableCell(withIdentifier: Constant.customCell.MoviewListCell, for: indexPath) as! MoviewListCell
        let data = viewModel.dataItems[indexPath.row]
        cell.lblMovieName.text = data.originalTitle
        cell.lblMovieDate.text = data.releaseDate
        cell.lblMovieDetail.text = data.overview
        let strUrl = imgUrl + data.posterPath
        cell.imgPoster.sd_setImage(with: URL(string: strUrl), placeholderImage: UIImage(), options: .continueInBackground, context: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

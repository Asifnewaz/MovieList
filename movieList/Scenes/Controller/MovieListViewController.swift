//
//  MovieListViewController.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    var tableViewDataSource: GenericDataSource<MovieListCell,MovieListCellVM>!
    var coordinator: MovieListVCCoordinator?
    var viewModel = MovieListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.viewDidLoad(self)
        self.getMovieList()
        self.initilizedMovieListDataSource()
    }
    
    private func initilizedMovieListDataSource(){
        self.tableViewDataSource = GenericDataSource.init(cellIdentifier: "MovieListCell", items:self.viewModel.movieList, configureCell: { (cell, vm,indexpath) in
            cell.eachCell = vm
        })
        self.movieListTableView.dataSource = self.tableViewDataSource
    }
    
    
    func getMovieList() {
        self.viewModel.getMovieListData(resource: self.viewModel.CreateMovieListRequest())
    }
    
}

//MARK: Movie List Delegate to update tableview
extension MovieListViewController: MovieListViewModelDelegate {
    func loadMovieListView() {
        self.tableViewDataSource.updateItems(self.viewModel.movieList)
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
        }
    }
}

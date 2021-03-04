//
//  MoviesTableViewController.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import UIKit

final class MoviesTableViewController: UITableViewController {
    
    private var viewModel = MoviesViewModel()
    private lazy var moviesTableViewDelegate = MoviesTableViewDelegate(viewModel: self.viewModel)
    private lazy var moviesTableViewDataSource = MoviesTableViewDataSource(viewModel: self.viewModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTableView()
        bindViewModel()
    }
    
    private func setupNavigationController() {
        navigationItem.title = Strings.movies_title.localized
    }
    
    private func setupTableView() {
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.description())
        tableView.delegate = moviesTableViewDelegate
        tableView.dataSource = moviesTableViewDataSource
        tableView.separatorStyle = .none
    }
    
    private func bindViewModel() {
        viewModel.reloadTableViewCallback = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        viewModel.didSelectItem = { [weak self] movie in
            self?.showDetailMovieViewController(for: movie)
        }
    }
    
    private func showDetailMovieViewController(for item: MovieViewModel) {
        let detail = UIViewController()
        navigationController?.pushViewController(detail, animated: true)
    }
    
}

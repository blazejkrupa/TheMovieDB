//
//  MovieDetailViewController.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    private let coverImageView: UIImageView = .init(borderWidth: 2.0, contentMode: .scaleAspectFit)
    private let titleLabel: UILabel = UILabel.init(withFontType: .bold, size: 16, textColor: .black)
    private let releaseDateLabel: UILabel = .init(withFontType: .normal, size: 12, textColor: .black)
            
    private let ratingLabel: UILabel = .init(withFontType: .normal, size: 12, textColor: .black)
        
    private lazy var topStackView: UIStackView = .init(arrangedSubviews: [coverImageView, titleLabel, releaseDateLabel,ratingLabel],
                                                       axis: .vertical,
                                                       alignment: .center,
                                                       spacing: 8)
    
    private let captionLabel: UILabel = .init(text: Strings.movie_detail_caption.localized,
                                              withFontType: .bold,
                                              size: 16,
                                              textColor: .black)
    
    private let overviewLabel: UILabel = .init(withFontType: .normal,
                                               size: 14,
                                               textColor: .black,
                                               alignment: .left,
                                               lineBreakMode: .byWordWrapping,
                                               numberOfLines: 0)
        
    private let viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupNavigationBar()
        bindViewModel()
        viewModel.build()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.star.image, style: .done, target: self, action: #selector(favoriteDidTap))
    }
    
    private func bindViewModel() {
        viewModel.setTitle = { [weak self] text in
            self?.titleLabel.text = text
        }
        
        viewModel.setRating = { [weak self] text in
            self?.ratingLabel.text = String(format: Strings.movie_detail_rating.localized,text)
        }
        
        viewModel.setOverview = { [weak self] text in
            self?.overviewLabel.text = text
        }
        
        viewModel.setImageUrl = { [weak self] text in
            self?.coverImageView.loadImageFromURL(path: text )
        }
    
        viewModel.setDate = { [weak self] text in
            self?.releaseDateLabel.text = text
        }
        
        viewModel.setFavorite = { [weak self] isFavorite in
            self?.navigationItem.rightBarButtonItem?.tintColor = isFavorite ? .golden : .black
        }
    }
    
    @objc private func favoriteDidTap() {
        viewModel.favoriteDidTap()
    }
}

extension MovieDetailViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(topStackView)
        view.addSubview(captionLabel)
        view.addSubview(overviewLabel)
    }
    
    private func setupConstraints() {
        coverImageView.heightAnchor.constraint(equalToConstant: 201).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 135).isActive = true
        if #available(iOS 11.0, *) {
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26).isActive = true
        } else {
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        }
        topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -41).isActive = true
        
        captionLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20).isActive = true
        captionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41).isActive = true
        captionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -41).isActive = true
        
        overviewLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 20).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -41).isActive = true
    }
}

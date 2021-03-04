//
//  MoviesTableViewCell.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

final class MoviesTableViewCell: UITableViewCell {
    
    private var coverImageView: UIImageView = .init(borderWidth: 1, contentMode: .scaleAspectFit)
    
    private var titleLabel: UILabel = .init(text: nil,
                                            withFontType: .bold,
                                            size: 14,
                                            textColor: .black)
    
    private var releaseDateLabel: UILabel = .init(text: nil,
                                                  withFontType: .normal,
                                                  size: 12,
                                                  textColor: .black)
    
    private var durationLabel: UILabel = .init(text: nil,
                                               withFontType: .normal,
                                               size: 12,
                                               textColor: .black)
    
    private lazy var favoriteButton: UIButton = .init(target: self,
                                                      selector: #selector(favoriteDidTap),
                                                      image: Images.star.image,
                                                      tint: .black)
    
    private lazy var centerStackView: UIStackView = .init(arrangedSubviews: [titleLabel, dateDurationStackView],
                                                          axis: .vertical,
                                                          spacing: 8)
    
    private lazy var dateDurationStackView: UIStackView = .init(arrangedSubviews: [releaseDateLabel, durationLabel],
                                                                axis: .vertical)
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    weak var item: MovieViewModel? {
        didSet {
            configureCell()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = UIImage()
    }
    
    private func configureCell() {
        guard let item = item else {
            return
        }
        titleLabel.text = item.title
        coverImageView.loadImageFromURL(path: item.imagePath)
        releaseDateLabel.text = item.releaseDate
        durationLabel.text = item.duration
        favoriteButton.tintColor = item.isFavorite ? .golden : .black
    }
    
    @objc private func favoriteDidTap() {
        item?.setFavorite()
        favoriteButton.tintColor = item?.isFavorite ?? false ? .golden : .black
    }
}


private extension MoviesTableViewCell {
    
    private func setupViews() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(centerStackView)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(separatorView)
    }
    
    private func setupConstraints() {
        coverImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -7).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: centerStackView.leadingAnchor, constant: -18).isActive = true
        
        centerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        centerStackView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -20).isActive = true
        centerStackView.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -18).isActive = true
        
        favoriteButton.widthAnchor.constraint(equalToConstant: 38).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        separatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
}

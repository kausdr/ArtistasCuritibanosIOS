//
//  ObraCell.swift
//  GaleriaDeArtistasCuritibanos
//
//  Created by user276516 on 4/27/25.
//

import UIKit

class ObraCell: UICollectionViewCell {
    
    static let identifier = "ObraCell"
    
    let imageView = UIImageView()
    let tituloLabel = UILabel()
    let artistaLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        tituloLabel.font = UIFont.boldSystemFont(ofSize: 14)
        tituloLabel.textAlignment = .center
        tituloLabel.numberOfLines = 2
        
        artistaLabel.font = UIFont.systemFont(ofSize: 12)
        artistaLabel.textAlignment = .center
        artistaLabel.numberOfLines = 1
        artistaLabel.textColor = .darkGray

        let stack = UIStackView(arrangedSubviews: [imageView, tituloLabel, artistaLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configurar(com obra: ObraDeArte) {
        imageView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
    }
}

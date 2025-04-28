//
//  DetalheObraViewController.swift
//  GaleriaDeArtistasCuritibanos
//
//  Created by user276516 on 4/27/25.
//

import UIKit

class DetalheObraViewController: UIViewController {
    
    var obra: ObraDeArte!

    let imagemView = UIImageView()
    let tituloLabel = UILabel()
    let artistaLabel = UILabel()
    let anoLabel = UILabel()
    let estiloLabel = UILabel()
    let descricaoLabel = UILabel()
    let compartilharButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        configurarComObra()
    }
    
    func setupViews() {
        imagemView.contentMode = .scaleAspectFit
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 24)
        tituloLabel.textAlignment = .center
        tituloLabel.numberOfLines = 0
        tituloLabel.translatesAutoresizingMaskIntoConstraints = false
        
        artistaLabel.font = UIFont.systemFont(ofSize: 18)
        artistaLabel.textAlignment = .center
        artistaLabel.numberOfLines = 0
        artistaLabel.textColor = .gray
        artistaLabel.translatesAutoresizingMaskIntoConstraints = false

        anoLabel.font = UIFont.systemFont(ofSize: 16)
        anoLabel.textAlignment = .center
        anoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        estiloLabel.font = UIFont.systemFont(ofSize: 16)
        estiloLabel.textAlignment = .center
        estiloLabel.translatesAutoresizingMaskIntoConstraints = false

        descricaoLabel.font = UIFont.systemFont(ofSize: 14)
        descricaoLabel.numberOfLines = 0
        descricaoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        compartilharButton.setTitle("Compartilhar", for: .normal)
        compartilharButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        compartilharButton.addTarget(self, action: #selector(compartilharObra), for: .touchUpInside)
        compartilharButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(imagemView)
        view.addSubview(tituloLabel)
        view.addSubview(artistaLabel)
        view.addSubview(anoLabel)
        view.addSubview(estiloLabel)
        view.addSubview(descricaoLabel)
        view.addSubview(compartilharButton)

        NSLayoutConstraint.activate([
            imagemView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imagemView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagemView.widthAnchor.constraint(equalToConstant: 200),
            imagemView.heightAnchor.constraint(equalToConstant: 200),
            
            tituloLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 20),
            tituloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tituloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            artistaLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 10),
            artistaLabel.leadingAnchor.constraint(equalTo: tituloLabel.leadingAnchor),
            artistaLabel.trailingAnchor.constraint(equalTo: tituloLabel.trailingAnchor),
            
            anoLabel.topAnchor.constraint(equalTo: artistaLabel.bottomAnchor, constant: 10),
            anoLabel.leadingAnchor.constraint(equalTo: tituloLabel.leadingAnchor),
            anoLabel.trailingAnchor.constraint(equalTo: tituloLabel.trailingAnchor),
            
            estiloLabel.topAnchor.constraint(equalTo: anoLabel.bottomAnchor, constant: 10),
            estiloLabel.leadingAnchor.constraint(equalTo: tituloLabel.leadingAnchor),
            estiloLabel.trailingAnchor.constraint(equalTo: tituloLabel.trailingAnchor),

            descricaoLabel.topAnchor.constraint(equalTo: estiloLabel.bottomAnchor, constant: 20),
            descricaoLabel.leadingAnchor.constraint(equalTo: tituloLabel.leadingAnchor),
            descricaoLabel.trailingAnchor.constraint(equalTo: tituloLabel.trailingAnchor),
            
            compartilharButton.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 20),
            compartilharButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configurarComObra() {
        imagemView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = "Artista: \(obra.artista)"
        anoLabel.text = "Ano: \(obra.ano)"
        estiloLabel.text = "Estilo: \(obra.estilo)"
        descricaoLabel.text = obra.descricao
    }
    
    @objc func compartilharObra() {
        let textoParaCompartilhar = """
        Obra: \(obra.titulo)
        Artista: \(obra.artista)
        Ano: \(obra.ano)
        Estilo: \(obra.estilo)
        Descrição: \(obra.descricao)
        """
        let activityVC = UIActivityViewController(activityItems: [textoParaCompartilhar], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}

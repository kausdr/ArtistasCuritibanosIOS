//
//  ViewController.swift
//  GaleriaDeArtistas
//
//  Created by Kauane S. R. on 26/04/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!

    var obras: [ObraDeArte] = [
        ObraDeArte(titulo: "Painel do Museu da Imagem e do Som - MIS", artista: "Poty Lazzarotto", ano: 2021, estilo: "Expressivo", imagemNome: "PotyLazzarotto", descricao: "Napoleon Potyguara Lazzarotto, conhecido como Poty Lazzarotto, foi um dos artistas mais emblemáticos do Paraná e do Brasil. Nascido em Curitiba em 29 de março de 1924, destacou-se como desenhista, gravurista, ilustrador, muralista e professor. Sua infância no bairro Capanema, próxima à linha férrea e ao restaurante familiar, frequentado por intelectuais e políticos, influenciou profundamente sua obra, marcada por temas urbanos e sociais. ​"),
        
        ObraDeArte(titulo: "Os quatro filhos de um casal de artista", artista: "Denise Roman", ano: 2021, estilo: "Lúdico", imagemNome: "Denise Roman", descricao: "Denise Roman é uma renomada artista plástica curitibana, nascida em 1957, amplamente reconhecida por seu trabalho em litografia e gravura em metal. Sua carreira, que se estende por mais de quatro décadas, é marcada por uma produção artística rica em detalhes e imaginação, frequentemente explorando temas lúdicos e elementos do folclore e da natureza.​"),
        
        ObraDeArte(titulo: "Recortes de um Lugar", artista: "Mazé Mendes", ano: 2021, estilo: "Abstrato", imagemNome: "Maze Mendes", descricao: "Artista multimídia, ela ministrou oficinas e foi professora da FAP/UNESPAR por muitos anos. Participou de diversos certames artísticos, no Brasil e no exterior, com mais de 20 exposições individuais e mais de 80 salões de arte e coletivas."),

    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white

        collectionView.delegate = self
        collectionView.dataSource = self

        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(ObraCell.self, forCellWithReuseIdentifier: ObraCell.identifier)

        self.view.addSubview(collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObraCell.identifier, for: indexPath) as! ObraCell
        let obra = obras[indexPath.row]
        
        // obra = obras[indexPath.row]

        let obraTitle = UILabel(frame: CGRect(x: 10, y: 110, width: cell.bounds.width - 20, height: 60))
        obraTitle.text = obra.titulo
        obraTitle.textAlignment = .center
        obraTitle.layer.cornerRadius = 10
        obraTitle.layer.masksToBounds = true
        obraTitle.font = UIFont.systemFont(ofSize: 12)
        obraTitle.numberOfLines = 0
        obraTitle.lineBreakMode = .byWordWrapping

        
        let artistaName = UILabel(frame: CGRect(x: 10, y: 160, width: cell.bounds.width - 20, height: 30))
        artistaName.text = "por: "+obra.artista
        artistaName.textAlignment = .center
        artistaName.layer.cornerRadius = 10
        artistaName.layer.masksToBounds = true
        artistaName.font = UIFont.systemFont(ofSize: 12)
        artistaName.numberOfLines = 0
        artistaName.lineBreakMode = .byWordWrapping


        let imageView = UIImageView(frame: CGRect(x: 10, y: 40, width: cell.bounds.width - 20, height: 80))
        imageView.image = UIImage(named: obra.imagemNome) // Carregando a imagem a partir do nome no Assets Catalog
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        cell.contentView.addSubview(imageView)
        cell.contentView.addSubview(obraTitle)
        cell.contentView.addSubview(artistaName)

        cell.configurar(com: obra)
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detalheVC = DetalheObraViewController()
        detalheVC.obra = obras[indexPath.row]
        navigationController?.pushViewController(detalheVC, animated: true)
    }
}

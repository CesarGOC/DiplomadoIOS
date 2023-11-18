//
//  PokemonDetailViewController.swift
//  Pokedex2
//
//  Created by Diplomado on 17/11/23.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    let viewModel: PokemonDetailViewModel
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = UIImage(systemName: "dog")
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        
        ])
        return imageView
    }()
    
    private lazy var pokemonNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Number: " + viewModel.pokemonNumber
        return label
    }()
    
    private lazy var pokemonHeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Height: " + viewModel.pokemonHeight
        return label
    }()
    
    private lazy var pokemonWeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Weight: " + viewModel.pokemonHeight
        return label
    }()
    
    
    
    init(pokemon: Pokemon){
        self.viewModel = PokemonDetailViewModel(pokemon: pokemon)
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func stackWeakness(){
//        for element in viewModel.pokemonWeaknesses{
//            lazy var pokemonWeaknessLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.font = UIFont.preferredFont(forTextStyle: .title1)
//            label.adjustsFontForContentSizeCategory = true
//            label.text = "Weight: " + element
//            return label
//            }()
//            pokemonWeaknessStackView.addArrangedSubview(pokemonWeaknessLabel)
//        }
    }
    
    private func setupView(){
        title = viewModel.pokemonName
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
//        let redView = UIView()
//        redView.backgroundColor = .systemRed
//        redView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(redView)
        
        let contentViewHeighAncor = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeighAncor.isActive = true
        contentViewHeighAncor.priority = UILayoutPriority.required - 1

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
//            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            redView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            redView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            redView.widthAnchor.constraint(equalToConstant: 100),
//            redView.heightAnchor.constraint(equalToConstant: 5000)
            
        ])
        
        let pokemonWeaknessStackView = UIStackView()
        pokemonWeaknessStackView.translatesAutoresizingMaskIntoConstraints = false
        pokemonWeaknessStackView.axis = .vertical
        pokemonWeaknessStackView.spacing = 5
        pokemonWeaknessStackView.distribution = .fillEqually
        
        for element in viewModel.pokemonWeaknesses{
            lazy var pokemonWeaknessLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            label.adjustsFontForContentSizeCategory = true
            label.text = "Weakness: " + element
            return label
            }()
            pokemonWeaknessStackView.addArrangedSubview(pokemonWeaknessLabel)
        }
        
        let pokemonInfoStackView = UIStackView()
        pokemonInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        pokemonInfoStackView.axis = .vertical
        pokemonInfoStackView.spacing = 16
        pokemonInfoStackView.distribution = .fillProportionally
        
        pokemonInfoStackView.addArrangedSubview(pokemonImageView)
        pokemonInfoStackView.addArrangedSubview(pokemonNumberLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonHeightLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonWeightLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonWeaknessStackView)
        
        contentView.addSubview(pokemonInfoStackView)
        
        NSLayoutConstraint.activate([
            pokemonInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pokemonInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        
    }
    
    
    


}

extension PokemonDetailViewController: PokemonDetailViewModelDelegate{
    func updatePokemonImage(to image: UIImage) {
        pokemonImageView.image = image
    }
    
    
}

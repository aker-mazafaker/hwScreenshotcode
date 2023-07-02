
import UIKit

class ViewController: UIViewController {
    
    let squareView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        
        return view
    }()
    
    let myCircle: UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .purple
        circle.layer.cornerRadius = 60
        return circle
    }()
    
    let myStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.layoutMargins = UIEdgeInsets(top: 70, left: 10, bottom: 0, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet..."
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut egestas egestas eros. Aenean finibus, mi et lacinia tincidunt, erat est pulvinar dui, nec luctus arcu dolor et est. Vestibulum pulvinar mattis arcu non pulvinar. Aliquam sodales sed libero elementum suscipit. Donec tincidunt ut turpis sed mollis. Nullam finibus, elit et facilisis tempus, felis risus pellentesque erat, in placerat tellus massa non libero. Curabitur non consequat ante, ac sodales sem. "
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
        view.backgroundColor = .systemBackground
        
    }
}

private extension ViewController {
    func setupScene(){
        squareView.addSubview(myCircle)
        view.addSubview(squareView)
        view.addSubview(myStackView)
        myStackView.addArrangedSubview(headerLabel)
        myStackView.addArrangedSubview(mainLabel)
        myStackView.addArrangedSubview(logoutButton)
    }
    
    func makeConstraints(){
        //для squareView
        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: view.topAnchor),
            squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            squareView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            squareView.heightAnchor.constraint(equalToConstant: 300)
        ])
        //для Circle
        NSLayoutConstraint.activate([
            myCircle.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
            myCircle.centerYAnchor.constraint(equalTo: squareView.centerYAnchor, constant: 40),
            myCircle.heightAnchor.constraint(equalToConstant: 120),
            myCircle.widthAnchor.constraint(equalToConstant: 120),
        ])
        // stackView
        NSLayoutConstraint.activate([
            myStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: myStackView.trailingAnchor, constant: 20),
          myStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor,  constant: 70)
        ])
        
    }
    @objc func buttonTapped() {
        print("Button tapped")
    }
}

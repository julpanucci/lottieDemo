
import UIKit
import Lottie

class ViewController: UIViewController {
    
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLottieView()
        setupButton()
        
     
    }

    var lottieView = LOTAnimationView()
    
    func setupLottieView() {
        lottieView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        lottieView.center = view.center
        lottieView.contentMode = .scaleAspectFit
        
        self.view.addSubview(lottieView)
    }
    
    func setupButton() {
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        button.setTitle("Get Image", for: .normal)
        button.backgroundColor = UIColor(red: 0.36, green: 0.79, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 5.0
        button.center.x = view.center.x
        button.center.y = lottieView.center.y + 200
        button.addTarget(self, action: #selector(fetchLottieImageFromServer), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func fetchLottieImageFromServer() {
        button.setTitle("Fetching ....", for: .normal)
        LottieService.fetchLottieFile(url: "http://localhost:3000/data") { (json) in
            DispatchQueue.main.async {
                self.lottieView.setAnimation(json: json)
                self.button.setTitle("Get Image", for: .normal)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lottieView.play()
    }

}


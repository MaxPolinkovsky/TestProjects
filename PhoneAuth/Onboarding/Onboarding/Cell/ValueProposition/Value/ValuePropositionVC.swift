import UIKit
import FirebaseAuth
import Then
import Amplitude

let reuseIdentifier = "Cell"

class ValuePropositionVC: UICollectionViewController {
    let pages = Pages.shared.pages
    weak var delegate: LoginVC?
    
    lazy var nextButton = UIButton().then {
        $0.backgroundColor = azure
        $0.layer.cornerRadius = 12
        $0.setTitle("Continue".localized(), for: .normal)
        $0.setTitleColor(white, for: .normal)
        $0.setTitleColor(veryLightPink, for: .highlighted)
        $0.titleLabel?.font = UIFont(name: "TeXGyreAdventor-Bold", size: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    lazy var pageControl = UIPageControl().then {
        $0.currentPage = 1
        $0.numberOfPages = pages.count
        $0.currentPageIndicatorTintColor = .black
        $0.pageIndicatorTintColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupCollectionView()
        setup()
        setupPage()
        collectionView.isScrollEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        Amplitude.instance().logEvent("value_proposition_screen_viewed")
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        self.collectionView.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func setupPage() {
        if pageControl.currentPage == 0 {
            nextButton.setTitle("Start".localized(), for: .normal)
            Amplitude.instance().logEvent("tap_start")
            pageControl.alpha = 0
        } else if pageControl.currentPage == 3 {
            nextButton.setTitle("Go!".localized(), for: .normal)
            nextButton.addTarget(self, action: #selector(toLogonVC), for: .touchUpInside)
            pageControl.alpha = 1
        } else {
            nextButton.setTitle("Continue".localized(), for: .normal)
            pageControl.alpha = 1
        }
    }

    @objc func nextButtonTapped() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count + 1 )
        let indexPath  = IndexPath(item: nextIndex, section: 0)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let sectionLeftInset = layout.sectionInset.left
        let attri = layout.layoutAttributesForItem(at: indexPath)
        collectionView.setContentOffset(CGPoint(x: ((attri?.frame.origin.x)! - sectionLeftInset), y: 0), animated: false)
        pageControl.currentPage = nextIndex
        //MARK: - MAKE HERE Transition to next Controller
        setupPage()
    }
    
    @objc func toLogonVC() {
        let dvc = LoginVC()
        dvc.viewModel = UpdateVM()
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
        
        Amplitude.instance().logEvent("login_viewed")
    }
}

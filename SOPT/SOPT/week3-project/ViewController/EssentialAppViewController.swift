import UIKit

class EssentialAppViewController: UIViewController {
    
    final let cellHeight: CGFloat = 70
    final let contentInterSpacing: CGFloat = 8 // 셀 사이의 간격
    final let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // 좌우 여백
    
    private var essentialAppList = EssentialApp.mockData
    
    private let headerView = EssentialAppHeaderView()
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // 그룹으로 나눈 데이터 배열 생성
    private var groupedData: [[EssentialApp]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        groupData() // 데이터를 그룹으로 나누기
        setUI()
        setLayout()
        setCollectionView()
    }
    
    // essentialAppList를 3개씩 묶어 groupedData 배열에 추가
    private func groupData() {
        let groupSize = 3
        for index in stride(from: 0, to: essentialAppList.count, by: groupSize) {
            let group = Array(essentialAppList[index..<min(index + groupSize, essentialAppList.count)])
            groupedData.append(group)
        }
    }
    
    private func setUI() {
        self.view.addSubviews(headerView, collectionView)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumLineSpacing = contentInterSpacing
        
        // 그룹당 3개의 셀이 보이도록 셀 너비 조정
        let cellWidth = UIScreen.main.bounds.width - 40
        flowLayout.itemSize = .init(width: cellWidth, height: cellHeight)
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(
                EssentialAppCell.self,
                forCellWithReuseIdentifier: EssentialAppCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
            
            $0.isPagingEnabled = true // 한 번에 한 그룹씩 넘기기 위한 페이징 활성화
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
}

extension EssentialAppViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 그룹의 수만큼 섹션 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return groupedData.count
    }
    
    // 각 섹션은 3개의 셀을 가지도록 설정
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return groupedData[section].count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: EssentialAppCell.identifier,
            for: indexPath
        ) as? EssentialAppCell else {
            return UICollectionViewCell()
        }
        
        let item = groupedData[indexPath.section][indexPath.item]
        cell.bind(item)
        return cell
    }
}

extension EssentialAppViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let cellWidth = (UIScreen.main.bounds.width - 40)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return contentInterSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return contentInset
    }
}

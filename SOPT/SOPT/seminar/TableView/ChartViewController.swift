//
//  ChartViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/30/24.
//

import UIKit
import Then
import SnapKit

class ChartViewController: UIViewController {
    
    private let tableView = UITableView()
    private let appList = App.sampleApps
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    private func setStyle() {
        self.view.addSubview(tableView)
        
        tableView.do {
            $0.register(
                ChartCell.self,
                forCellReuseIdentifier: ChartCell.identifier
            )
            $0.rowHeight = 250
            $0.delegate = self
            $0.dataSource = self
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

extension ChartViewController: UITableViewDelegate { }
extension ChartViewController: UITableViewDataSource {
    
    // 섹션별로 해당 섹션의 행 수를 반환하는 메소드
    // TableView의 셀 개수를 appList의 아이템 개수만큼 설정
    func tableView(
        _ tableView: UITableView,
        // 섹션 번호를 매개변수로 (섹션마다 행 다르게 설정 가능)
        numberOfRowsInSection section: Int
    ) -> Int {
        return appList.count // appList 배열에 들어 있는 요소의 개수 반환
    }
    
    // 각 행의 셀 객체를 반환하는 메소드
    // TableView의 각 행에 표시할 셀을 생성하고 반환
    func tableView(
        _ tableView: UITableView,
        // 셀의 위치를 매개변수로 (섹션 번호와 행 번호 포함)
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        // 재사용 큐에서 순서에 맞는 cell을 dequeue
        // 재사용할 셀이 없으면 자동으로 새로운 셀 생성하여 반환
        guard let cell = tableView.dequeueReusableCell(
            // indexPath에 위치한 셀의 식별자가 ChartCell인지 확인
            withIdentifier: ChartCell.identifier,
            for: indexPath
            
            // 식별자가 맞다면 dequeue한 셀을 ChartCell 타입으로 변환
            // 타입 캐스팅 실패 시 비어있는 기본 셀 반환
        ) as? ChartCell else { return UITableViewCell() }
        
        // cell의 configure 메소드 호출
        // appList 배열에서 현재 indexPath와 일치하는 데이터를 셀에 넘겨줌
        cell.configure(app: appList[indexPath.row])
        
        return cell
    }
}

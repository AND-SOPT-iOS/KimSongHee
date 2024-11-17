//
//  ReviewModel.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import Foundation

import UIKit

struct Review: Hashable {
    let title: String
    let star: String
    let reviewDate: String
    let nickname: String
    let reviewContent: String
    let answerDate: String
    let answerContent: String
}

extension Review {
    static let mockData: [Review] = [
        Review(
            title: "토스 UX 전버전으로 해주세요",
            star: "★★★★★",
            reviewDate: "9월 27일",
            nickname: "흑 운영자님 ㅠㅠ",
            reviewContent: "최근 업데이트가 토스 만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데",
            answerDate: "9월 29일",
            answerContent: "안녕하세요, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자"
        ),
        Review(
            title: "홈화면 가독성 떨어짐",
            star: "★★★★★",
            reviewDate: "9월 27일",
            nickname: "케이크최고최고",
            reviewContent: "항상 잘 쓰고 있는 토스 앱이지만 이번엔 업데이트하고 나서 앱 열면 뜨는 메인 홈 화면에 어느 은행, 계좌명, 금액 폰트가 너무 작아",
            answerDate: "9월 29일",
            answerContent: "안녕하세요, 케이크최고최고님 토스팀입니다. 먼저 서비스 이용에 불편을 드렸다면 대단히 죄"
        ),
        Review(
            title: "??? 뭐야 내 토스 돌려줘요",
            star: "★★★★★",
            reviewDate: "9월 27일",
            nickname: "림림심",
            reviewContent: "아니 토스없이는 못사는 사람으로 만들어놓고... 왜 갑자기 이렇게 NO쌈@뽕;;;한 디자인으로 업데이트해주신겁닉까.... 뭔가 넘 구린",
            answerDate: "9월 29일",
            answerContent: "안녕하세요, 림림심님 토스팀입니다. 먼저 서비스 이용에 불편을 드렸다면 대단히 죄송합니"
        ),
        Review(
            title: "다크모드 아이콘",
            star: "★★★★★",
            reviewDate: "10월 5일",
            nickname: "루이스디",
            reviewContent: "항상 잘 사용하고 있습니다. 그런데 이번 iOS 18에 추가된 다크 모드 아이콘이 토스가 유독 적용이 늦어지고 있어서요. 최근 연례행사로 바쁘",
            answerDate: "10월 7일",
            answerContent: "안녕하세요. 루이스디님, 토스팀입니다. 토스앱 이용에 불편을 드려 대단히 죄송합니다. 고"
        ),
        Review(
            title: "너무 조아여",
            star: "★★★★★",
            reviewDate: "8월 9일",
            nickname: "?",
            reviewContent: "현재 토스 이용하고 있는 학생입니다! 최근 원그리기 이벤트, 반대항 수박 이벤트처럼 친구들과 함께 즐길 수 있는 이벤트가 많아",
            answerDate: "",
            answerContent: ""
        ),
    ]
}

//
//  InitalData.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation
import Then

class HealthInfoAbstract: Then {
    var name: String = ""
    var time: TimeInterval = 0
    var content: String = ""
}

class BadgeAbstract: Then {
    var name: String = ""
    var imageName: String = "noImage"
    var content: String = ""
    var conditionType: ConditionType = .time
    var conditionValue: Double = 0
}

struct InitialData {
    static let healthInfos: [HealthInfoAbstract] = [
        HealthInfoAbstract().then{
            $0.name = "혈압, 맥박, 손과 발의 체온이 정상으로 돌아옴"
            $0.time = 1200
            $0.content = "20분"
        },
        HealthInfoAbstract().then{
            $0.name = "혈중 니코틴 농도가 낮아지기 시작함"
            $0.time = 7200
            $0.content = "2시간"
        },
        HealthInfoAbstract().then{
            $0.name = "혈중 니코틴 수치가 6.2%로 거의 사라짐"
            $0.time = 28800
            $0.content = "8시간"
        },
        HealthInfoAbstract().then{
            $0.name = "혈중 산소량과 일산화 탄소양이 정상으로 돌아옴"
            $0.time = 43200
            $0.content = "12시간"
        },
        HealthInfoAbstract().then{
            $0.name = "일산화 탄소가 배출됨"
            $0.time = 64800
            $0.content = "18시간"
        },
        HealthInfoAbstract().then{
            $0.name = "후각과 미각이 정상으로 돌아오기 시작"
            $0.time = 172800
            $0.content = "48시간"
        },
        HealthInfoAbstract().then{
            $0.name = "니코틴이 완전히 사라짐, 폐 기능 향상"
            $0.time = 259200
            $0.content = "72시간"
        },
        HealthInfoAbstract().then{
            $0.name = "진하던 가래가 묽어짐"
            $0.time = 604800
            $0.content = "1주"
        },
        HealthInfoAbstract().then{
            $0.name = "중독 증세가 괴롭지 않은 지점에 도달"
            $0.time = 1209600
            $0.content = "2주"
        },
        HealthInfoAbstract().then{
            $0.name = "니코틴 수용체 감소로 비흡연자와 비슷한 수준에 도달"
            $0.time = 1814400
            $0.content = "3주"
        },
        HealthInfoAbstract().then{
            $0.name = "금단 현상 종료, 인슐린 저항성이 정상으로 돌아옴"
            $0.time = 2592000
            $0.content = "1달"
        },
        HealthInfoAbstract().then{
            $0.name = "혈액순환이 좋아지고 폐 기능이 30% 향상"
            $0.time = 5184000
            $0.content = "2달"
        },
        HealthInfoAbstract().then{
            $0.name = "순환기능 향상, 심장마비가 올 확률 감소"
            $0.time = 7776000
            $0.content = "3달"
        },
        HealthInfoAbstract().then{
            $0.name = "폐의 섬모가 다시 자라남, 전체적인 체력 증가"
            $0.time = 23328000
            $0.content = "9달"
        },
        HealthInfoAbstract().then{
            $0.name = "심혈관계통 질환이 비흡연자의 절반으로 감소"
            $0.time = 31536000
            $0.content = "1년"
        },
        HealthInfoAbstract().then{
            $0.name = "흡연으로 폐에 쌓였던 가래가 완전히 제거됨"
            $0.time = 63072000
            $0.content = "2년"
        },
        HealthInfoAbstract().then{
            $0.name = "뇌졸증에 걸릴 위험이 비흡연자와 같아짐"
            $0.time = 157680000
            $0.content = "5년"
        },
        HealthInfoAbstract().then{
            $0.name = "흡연 관련 암 발병율이 흡연자의 절반으로 감소됨"
            $0.time = 315360000
            $0.content = "10년"
        },
        HealthInfoAbstract().then{
            $0.name = "심혈관계통 질환에 걸릴 위험이 비흡연자와 같아짐"
            $0.time = 473040000
            $0.content = "15년"
        }
    ]
    
    static let badges: [BadgeAbstract] = [
        BadgeAbstract().then{
            $0.name = "24hours"
            $0.imageName = "Badge-24hours"
            $0.content = "Good start !"
            $0.conditionType = .time
            $0.conditionValue = 86400
        },
        BadgeAbstract().then{
            $0.name = "48hours"
            $0.imageName = "Badge-48hours"
            $0.content = "Nice"
            $0.conditionType = .time
            $0.conditionValue = 172800
        },
        BadgeAbstract().then{
            $0.name = "72hours"
            $0.imageName = "Badge-72hours"
            $0.content = "Keep it up !"
            $0.conditionType = .time
            $0.conditionValue = 259200
        },
        BadgeAbstract().then{
            $0.name = "A Week"
            $0.imageName = "Badge-7days"
            $0.content = "Getting better"
            $0.conditionType = .time
            $0.conditionValue = 604800
        },
        BadgeAbstract().then{
            $0.name = "Money saved"
            $0.imageName = "Badge-10000won"
            $0.content = "10,000 won saved!"
            $0.conditionType = .money
            $0.conditionValue = 10000
        },
        BadgeAbstract().then{
            $0.name = "Money saved"
            $0.imageName = "Badge-moneysave"
            $0.content = "100,000 won saved!"
            $0.conditionType = .money
            $0.conditionValue = 100000
        },
        BadgeAbstract().then{
            $0.name = "First reward"
            $0.imageName = "Badge-1reward"
            $0.content = "You got a reward"
            $0.conditionType = .reward
            $0.conditionValue = 1
        }
        
    ]
}

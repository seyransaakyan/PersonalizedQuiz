//
//  Questions.swift
//  Personalized Quiz
//
//  Created by Seyran Saakyan on 03.04.2022.
//
enum ResponseType{
    case single
    case multiple
    case range
}

struct Question{
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question{
    static func getQuestion() -> [Question]{
        return [
            Question(text: "Какую пищу вы предпочитаете?", type: .single, answers: [Answer(text: "Стейк", type: .lion), Answer(text: "Рыба", type: .pinguin), Answer(text: "Банан", type: .monkey), Answer(text: "Ребрышки", type: .dog)]),
            Question(text: "Что вы любите делать?", type: .multiple, answers: [Answer(text: "Плавать", type: .pinguin), Answer(text: "Спать", type: .lion), Answer(text: "Обниматься", type: .dog), Answer(text: "Лазать по деревьям", type: .monkey)]),
            Question(text: "Любите ли вы поездки на машине?", type: .range , answers: [Answer(text: "Ненавижу", type: .pinguin), Answer(text: "Ненавижу", type: .lion), Answer(text: "Обожаю", type: .dog), Answer(text: "Обожаю", type: .monkey)])
        ]
    }
}

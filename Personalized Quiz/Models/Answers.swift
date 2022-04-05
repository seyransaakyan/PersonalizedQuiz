//
//  Answers.swift
//  Personalized Quiz
//
//  Created by Seyran Saakyan on 03.04.2022.
//

struct Answer{
    let text: String
    let type: AnimalType
    
}
enum AnimalType: Character{
    case dog = "🐶"
    case lion = "🦁"
    case pinguin = "🐧"
    case monkey = "🐵"
    
    var definition: String{
        switch self{
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь"
        case .lion:
            return "Вы сильный и независимый. Наблюдаете за всеми со стороны и анализируете людей."
        case .monkey:
            return "Вы озорник. Любите веселиться с друзьями и жить беззаботно."
        case .pinguin:
            return "Вы очень чуткий человек. Любите заботу и внимание вашего окружения."
        }
    }
}

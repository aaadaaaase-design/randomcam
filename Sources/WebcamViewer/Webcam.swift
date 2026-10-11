import Foundation

struct Webcam: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let countryFlag: String
    let embedURL: URL
    /// Most public traffic/tourism webcams do NOT carry audio at all (no mic,
    /// or audio stripped for legal/bandwidth reasons). Only mark this true if
    /// you've personally confirmed the page actually plays sound.
    let hasAudio: Bool
}

/// Starter list of public webcam pages from around the world — edit freely.
/// Add any public webcam page URL here (the app just loads it in a web view,
/// so anything that works in mobile Safari works here too) and the Random
/// button will pick it up automatically.
let sampleWebcams: [Webcam] = [
    Webcam(title: "Times Square", location: "Нью-Йорк, США", countryFlag: "🇺🇸",
           embedURL: URL(string: "https://www.earthcam.com/usa/newyork/timessquare/?cam=tsstreet")!, hasAudio: false),
    Webcam(title: "Empire State Building", location: "Нью-Йорк, США", countryFlag: "🇺🇸",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/united-states/new-york/new-york/empire-state-building.html")!, hasAudio: false),
    Webcam(title: "Las Vegas Strip", location: "Лас-Вегас, США", countryFlag: "🇺🇸",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/united-states/nevada/las-vegas/las-vegas.html")!, hasAudio: false),
    Webcam(title: "Майами-Бич", location: "Майами, США", countryFlag: "🇺🇸",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/united-states/florida/miami/miami.html")!, hasAudio: false),
    Webcam(title: "CN Tower", location: "Торонто, Канада", countryFlag: "🇨🇦",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/canada/ontario/toronto/cn-tower.html")!, hasAudio: false),
    Webcam(title: "Пласа-Майор", location: "Куско, Перу", countryFlag: "🇵🇪",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/peru/cusco/cusco/plaza-mayor.html")!, hasAudio: false),
    Webcam(title: "Мирафлорес", location: "Лима, Перу", countryFlag: "🇵🇪",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/peru/lima/lima/miraflores.html")!, hasAudio: false),
    Webcam(title: "Бразилиа", location: "Бразилиа, Бразилия", countryFlag: "🇧🇷",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/brasil/distrito-federal/brasilia/brasilia.html")!, hasAudio: false),
    Webcam(title: "Abbey Road", location: "Лондон, Великобритания", countryFlag: "🇬🇧",
           embedURL: URL(string: "https://www.abbeyroad.com/crossing")!, hasAudio: false),
    Webcam(title: "Фонтан Треви", location: "Рим, Италия", countryFlag: "🇮🇹",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/italia/lazio/roma/fontana-di-trevi.html")!, hasAudio: false),
    Webcam(title: "Колизей", location: "Рим, Италия", countryFlag: "🇮🇹",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/italia/lazio/roma/roma-colosseo.html")!, hasAudio: false),
    Webcam(title: "Пьяцца Сан-Марко", location: "Венеция, Италия", countryFlag: "🇮🇹",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/italia/veneto/venezia/piazza-san-marco.html")!, hasAudio: false),
    Webcam(title: "Гранд-канал", location: "Венеция, Италия", countryFlag: "🇮🇹",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/italia/veneto/venezia/canal-grande.html")!, hasAudio: false),
    Webcam(title: "Дуомо", location: "Флоренция, Италия", countryFlag: "🇮🇹",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/italia/toscana/firenze/piazza-duomo-firenze.html")!, hasAudio: false),
    Webcam(title: "Эйфелева башня", location: "Париж, Франция", countryFlag: "🇫🇷",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/france/ile-de-france/paris/tour-eiffel.html")!, hasAudio: false),
    Webcam(title: "Акрополь", location: "Афины, Греция", countryFlag: "🇬🇷",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/ellada/atiki/athina/acropolis-parthenon.html")!, hasAudio: false),
    Webcam(title: "Староместская площадь", location: "Прага, Чехия", countryFlag: "🇨🇿",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/czech-republic/prague/prague/prague.html")!, hasAudio: false),
    Webcam(title: "Альгамбра", location: "Гранада, Испания", countryFlag: "🇪🇸",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/espana/andalucia/granada/alhambra-de-granada.html")!, hasAudio: false),
    Webcam(title: "Пласа-дель-Калао", location: "Мадрид, Испания", countryFlag: "🇪🇸",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/espana/comunidad-de-madrid/madrid/madrid-plaza-del-callao.html")!, hasAudio: false),
    Webcam(title: "Плаза Сан-Франсиско", location: "Севилья, Испания", countryFlag: "🇪🇸",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/espana/andalucia/sevilla/siviglia-plaza-san-francisco.html")!, hasAudio: false),
    Webcam(title: "Вавельский замок", location: "Краков, Польша", countryFlag: "🇵🇱",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/poland/lesser-poland-voivodeship/krakow/krakow.html")!, hasAudio: false),
    Webcam(title: "Хадльгримскиркья", location: "Рейкьявик, Исландия", countryFlag: "🇮🇸",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/iceland/greater-reykjavik/reykjavik/hallgrimskirkja-church.html")!, hasAudio: false),
    Webcam(title: "Dubai Marina", location: "Дубай, ОАЭ", countryFlag: "🇦🇪",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/united-arab-emirates/dubai/dubai/dubai-marina.html")!, hasAudio: false),
    Webcam(title: "Стена Плача", location: "Иерусалим, Израиль", countryFlag: "🇮🇱",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/israel/jerusalem-district/jerusalem/western-wall.html")!, hasAudio: false),
    Webcam(title: "Петра", location: "Маан, Иордания", countryFlag: "🇯🇴",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/jordan/maan/amman/petra-visitor-center.html")!, hasAudio: false),
    Webcam(title: "Пляж Ламай", location: "Самуи, Таиланд", countryFlag: "🇹🇭",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/thailand/surat-thani/ko-samui/lamai.html")!, hasAudio: false),
    Webcam(title: "Скайлайн Шанхая", location: "Шанхай, Китай", countryFlag: "🇨🇳",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/china/shanghai/shanghai/skyline-of-shanghai.html")!, hasAudio: false),
    Webcam(title: "Сиднейская гавань", location: "Сидней, Австралия", countryFlag: "🇦🇺",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/australia/new-south-wales/sydney/sydney.html")!, hasAudio: false),
    Webcam(title: "Река Брисбен", location: "Брисбен, Австралия", countryFlag: "🇦🇺",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/australia/queensland/brisbane/brisbane-river.html")!, hasAudio: false),
    Webcam(title: "Столовая гора", location: "Кейптаун, ЮАР", countryFlag: "🇿🇦",
           embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/south-africa/western-cape/cape-town/panorama-of-table-mountain.html")!, hasAudio: false),
]

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

districts_data = [
  { short_name: 'ЦАО', name: 'Центральный', square: 66.18, population: 779_086 },
  { short_name: 'САО', name: 'Северный', square: 113.73, population: 1_175_229 },
  { short_name: 'СВАО', name: 'Северо-Восточный', square: 101.88, population: 1_427_597 },
  { short_name: 'ВАО', name: 'Восточный', square: 154.84, population: 1_514_420 },
  { short_name: 'ЮВАО', name: 'Юго-Восточный', square: 117.56, population: 1_432_839 },
  { short_name: 'ЮАО', name: 'Южный', square: 131.77, population: 1_773_425 },
  { short_name: 'ЮЗАО', name: 'Юго-Западный', square: 111.36, population: 1_442_971 },
  { short_name: 'ЗАО', name: 'Западный', square: 153.03, population: 1_383_853 },
  { short_name: 'СЗАО', name: 'Северо-Западный', square: 93.28, population: 1_009_217 },
  { short_name: 'ЗелАО', name: 'Зеленоградский', square: 37.20, population: 253_687 },
  { short_name: 'НМАО', name: 'Новомосковский', square: 361.36, population: 300_375 },
  { short_name: 'ТАО', name: 'Троицкий', square: 1084.34, population: 142_767 }
]

districts_data.each do |data|
  District.find_or_create_by(data)
end

areas_data = [
  { id: 1, name: 'Академический', square: 5.0, population: 110, population_density: 18_895.54,
    square_housing_stock: 2467.0, living_square_per_person: 22.0, district_id: 19 },
  { id: 2, name: 'Алексеевский', square: 5.0, population: 79, population_density: 14_970.32,
    square_housing_stock: 1607.0, living_square_per_person: 20.0, district_id: 15 },
  { id: 3, name: 'Алтуфьевский', square: 3.0, population: 57, population_density: 17_649.54,
    square_housing_stock: 839.0, living_square_per_person: 15.0, district_id: 15 },
  { id: 4, name: 'Арбат', square: 2.0, population: 35, population_density: 16_964.93,
    square_housing_stock: 731.0, living_square_per_person: 26.0, district_id: 13 },
  { id: 5, name: 'Аэропорт', square: 4.0, population: 79, population_density: 17_310.7,
    square_housing_stock: 1939.0, living_square_per_person: 25.0, district_id: 14 },
  { id: 6, name: 'Бабушкинский', square: 5.0, population: 88, population_density: 17_375.15,
    square_housing_stock: 1586.0, living_square_per_person: 18.0, district_id: 15 },
  { id: 7, name: 'Басманный', square: 8.0, population: 110, population_density: 13_253.05,
    square_housing_stock: 1991.0, living_square_per_person: 18.0, district_id: 13 },
  { id: 8, name: 'Беговой', square: 5.0, population: 41, population_density: 7552.34,
    square_housing_stock: 791.0, living_square_per_person: 18.0, district_id: 14 },
  { id: 9, name: 'Бескудниковский', square: 3.0, population: 78,
    population_density: 23_808.18, square_housing_stock: 1391.0, living_square_per_person: 18.0, district_id: 14 },
  { id: 10, name: 'Бибирево', square: 6.0, population: 158, population_density: 24_641.71,
    square_housing_stock: 2521.0, living_square_per_person: 15.0, district_id: 15 },
  { id: 11, name: 'Бирюлёво Восточное', square: 14.0, population: 152,
    population_density: 10_348.21, square_housing_stock: 2122.0, living_square_per_person: 14.0, district_id: 18 },
  { id: 12, name: 'Бирюлёво Западное', square: 8.0, population: 87,
    population_density: 10_315.75, square_housing_stock: 1183.0, living_square_per_person: 13.0, district_id: 18 },
  { id: 13, name: 'Богородское', square: 10.0, population: 110,
    population_density: 10_746.97, square_housing_stock: 1744.0, living_square_per_person: 16.0, district_id: 16 },
  { id: 14, name: 'Братеево', square: 7.0, population: 108, population_density: 14_230.93,
    square_housing_stock: 1585.0, living_square_per_person: 15.0, district_id: 18 },
  { id: 15, name: 'Бутырский', square: 5.0, population: 70, population_density: 14_078.77,
    square_housing_stock: 1236.0, living_square_per_person: 18.0, district_id: 15 },
  { id: 16, name: 'Вешняки', square: 10.0, population: 120, population_density: 11_282.93,
    square_housing_stock: 1976.0, living_square_per_person: 16.0, district_id: 16 },
  { id: 17, name: 'Внуково', square: 17.0, population: 24, population_density: 1417.16,
    square_housing_stock: 416.0, living_square_per_person: 17.0, district_id: 20 },
  { id: 18, name: 'Войковский', square: 6.0, population: 70, population_density: 10_665.51,
    square_housing_stock: 1531.0, living_square_per_person: 23.0, district_id: 14 },
  { id: 19, name: 'Восточное Дегунино', square: 3.0, population: 98,
    population_density: 26_006.9, square_housing_stock: 1592.0, living_square_per_person: 16.0, district_id: 14 },
  { id: 20, name: 'Восточное Измайлово', square: 3.0, population: 77,
    population_density: 20_081.56, square_housing_stock: 706.0, living_square_per_person: 9.0, district_id: 16 },
  { id: 21, name: 'Восточный', square: 3.0, population: 13, population_density: 4300.32,
    square_housing_stock: 227.0, living_square_per_person: 18.0, district_id: 16 },
  { id: 22, name: 'Выхино-Жулебино', square: 14.0, population: 225,
    population_density: 15_032.93, square_housing_stock: 3704.0, living_square_per_person: 17.0, district_id: 17 },
  { id: 23, name: 'Гагаринский', square: 5.0, population: 81, population_density: 14_803.64,
    square_housing_stock: 2095.0, living_square_per_person: 26.0, district_id: 19 },
  { id: 24, name: 'Головинский', square: 8.0, population: 102, population_density: 11_503.02,
    square_housing_stock: 1806.0, living_square_per_person: 17.0, district_id: 14 },
  { id: 25, name: 'Гольяново', square: 14.0, population: 161, population_density: 10_748.9,
    square_housing_stock: 3024.0, living_square_per_person: 19.0, district_id: 16 },
  { id: 26, name: 'Даниловский', square: 12.0, population: 94, population_density: 7478.73,
    square_housing_stock: 2847.0, living_square_per_person: 31.0, district_id: 18 },
  { id: 27, name: 'Дмитровский', square: 7.0, population: 92, population_density: 12_710.01,
    square_housing_stock: 1364.0, living_square_per_person: 15.0, district_id: 14 },
  { id: 28, name: 'Донской', square: 5.0, population: 50, population_density: 8806.28,
    square_housing_stock: 1094.0, living_square_per_person: 23.0, district_id: 18 },
  { id: 29, name: 'Дорогомилово', square: 7.0, population: 75, population_density: 9447.17,
    square_housing_stock: 1906.0, living_square_per_person: 28.0, district_id: 20 },
  { id: 30, name: 'Замоскворечье', square: 4.0, population: 58,
    population_density: 13_579.86, square_housing_stock: 1072.0, living_square_per_person: 19.0, district_id: 13 },
  { id: 31, name: 'Западное Дегунино', square: 7.0, population: 83,
    population_density: 11_055.91, square_housing_stock: 1385.0, living_square_per_person: 17.0, district_id: 14 },
  { id: 32, name: 'Зюзино', square: 5.0, population: 126, population_density: 23_261.65,
    square_housing_stock: 2132.0, living_square_per_person: 17.0, district_id: 19 },
  { id: 33, name: 'Зябликово', square: 4.0, population: 133, population_density: 30_487.67,
    square_housing_stock: 1879.0, living_square_per_person: 14.0, district_id: 18 },
  { id: 34, name: 'Ивановское', square: 10.0, population: 125, population_density: 12_339.25,
    square_housing_stock: 2075.0, living_square_per_person: 16.0, district_id: 16 },
  { id: 35, name: 'Измайлово', square: 15.0, population: 107, population_density: 7045.87,
    square_housing_stock: 2055.0, living_square_per_person: 19.0, district_id: 16 },
  { id: 36, name: 'Капотня', square: 8.0, population: 33, population_density: 4188.71,
    square_housing_stock: 408.0, living_square_per_person: 13.0, district_id: 17 },
  { id: 37, name: 'Коньково', square: 7.0, population: 154, population_density: 21_566.85,
    square_housing_stock: 3098.0, living_square_per_person: 20.0, district_id: 19 },
  { id: 38, name: 'Коптево', square: 5.0, population: 103, population_density: 19_273.79,
    square_housing_stock: 2449.0, living_square_per_person: 25.0, district_id: 14 },
  { id: 39, name: 'Косино-Ухтомский', square: 15.0, population: 82,
    population_density: 5465.12, square_housing_stock: 1336.0, living_square_per_person: 18.0, district_id: 16 },
  { id: 40, name: 'Котловка', square: 3.0, population: 66, population_density: 16_908.38,
    square_housing_stock: 1104.0, living_square_per_person: 17.0, district_id: 19 },
  { id: 41, name: 'Красносельский', square: 4.0, population: 47, population_density: 9650.2,
    square_housing_stock: 871.0, living_square_per_person: 18.0, district_id: 13 },
  { id: 42, name: 'Крылатское', square: 12.0, population: 81, population_density: 6783.8,
    square_housing_stock: 1850.0, living_square_per_person: 22.0, district_id: 20 },
  { id: 43, name: 'Крюково', square: 10.0, population: 107, population_density: 10_225.55,
    square_housing_stock: 1799.0, living_square_per_person: 21.0, district_id: 22 },
  { id: 44, name: 'Кузьминки', square: 8.0, population: 144, population_density: 17_698.9,
    square_housing_stock: 2312.0, living_square_per_person: 16.0, district_id: 17 },
  { id: 45, name: 'Кунцево', square: 16.0, population: 150, population_density: 9078.74,
    square_housing_stock: 2587.0, living_square_per_person: 17.0, district_id: 20 },
  { id: 46, name: 'Куркино', square: 7.0, population: 34, population_density: 4323.16,
    square_housing_stock: 900.0, living_square_per_person: 42.0, district_id: 21 },
  { id: 47, name: 'Левобережный', square: 8.0, population: 53, population_density: 6625.88,
    square_housing_stock: 933.0, living_square_per_person: 17.0, district_id: 14 },
  { id: 48, name: 'Лефортово', square: 9.0, population: 95, population_density: 10_529.47,
    square_housing_stock: 1384.0, living_square_per_person: 15.0, district_id: 17 },
  { id: 49, name: 'Лианозово', square: 5.0, population: 85, population_density: 14_762.52,
    square_housing_stock: 1563.0, living_square_per_person: 18.0, district_id: 15 },
  { id: 50, name: 'Ломоносовский', square: 3.0, population: 88,
    population_density: 26_358.38, square_housing_stock: 2881.0, living_square_per_person: 33.0, district_id: 19 },
  { id: 51, name: 'Лосиноостровский', square: 5.0, population: 83,
    population_density: 15_021.84, square_housing_stock: 1486.0, living_square_per_person: 18.0, district_id: 15 },
  { id: 52, name: 'Люблино', square: 17.0, population: 173, population_density: 9948.36,
    square_housing_stock: 2739.0, living_square_per_person: 15.0, district_id: 17 },
  { id: 53, name: 'Марфино', square: 2.0, population: 35, population_density: 11_923.57,
    square_housing_stock: 711.0, living_square_per_person: 26.0, district_id: 15 },
  { id: 54, name: 'Марьина Роща', square: 4.0, population: 66, population_density: 14_270.73,
    square_housing_stock: 1118.0, living_square_per_person: 16.0, district_id: 15 },
  { id: 55, name: 'Марьино', square: 11.0, population: 252, population_density: 21_211.0,
    square_housing_stock: 4523.0, living_square_per_person: 18.0, district_id: 17 },
  { id: 56, name: 'Матушкино', square: 4.0, population: 39, population_density: 9028.77,
    square_housing_stock: 781.0, living_square_per_person: 20.0, district_id: 22 },
  { id: 57, name: 'Метрогородок', square: 27.0, population: 38, population_density: 1389.55,
    square_housing_stock: 575.0, living_square_per_person: 15.0, district_id: 16 },
  { id: 58, name: 'Мещанский', square: 4.0, population: 60, population_density: 13_053.04,
    square_housing_stock: 1417.0, living_square_per_person: 24.0, district_id: 13 },
  { id: 59, name: 'Митино', square: 12.0, population: 197, population_density: 15_579.01,
    square_housing_stock: 3658.0, living_square_per_person: 21.0, district_id: 21 },
  { id: 60, name: 'Можайский', square: 10.0, population: 137, population_density: 12_827.03,
    square_housing_stock: 2655.0, living_square_per_person: 20.0, district_id: 20 },
  { id: 61, name: 'Молжаниновский', square: 21.0, population: 11,
    population_density: 549.77, square_housing_stock: 69.0, living_square_per_person: 19.0, district_id: 14 },
  { id: 62, name: 'Москворечье-Сабурово', square: 9.0, population: 80,
    population_density: 8670.0, square_housing_stock: 1314.0, living_square_per_person: 17.0, district_id: 18 },
  { id: 63, name: 'Нагатино-Садовники', square: 8.0, population: 82,
    population_density: 10_057.77, square_housing_stock: 960.0, living_square_per_person: 12.0, district_id: 18 },
  { id: 64, name: 'Нагатинский Затон', square: 9.0, population: 120,
    population_density: 12_336.63, square_housing_stock: 1848.0, living_square_per_person: 16.0, district_id: 18 },
  { id: 65, name: 'Нагорный', square: 5.0, population: 80, population_density: 14_893.73,
    square_housing_stock: 1551.0, living_square_per_person: 20.0, district_id: 18 },
  { id: 66, name: 'Некрасовка', square: 11.47, population: 87, population_density: 7660.59,
    square_housing_stock: 385.0, living_square_per_person: 20.0, district_id: 17 },
  { id: 67, name: 'Нижегородский', square: 7.0, population: 45, population_density: 6008.72,
    square_housing_stock: 722.0, living_square_per_person: 16.0, district_id: 17 },
  { id: 68, name: 'Новогиреево', square: 4.0, population: 99, population_density: 22_432.13,
    square_housing_stock: 1704.0, living_square_per_person: 17.0, district_id: 16 },
  { id: 69, name: 'Новокосино', square: 3.0, population: 107, population_density: 29_790.56,
    square_housing_stock: 1682.0, living_square_per_person: 16.0, district_id: 16 },
  { id: 70, name: 'Ново-Переделкино', square: 8.0, population: 122,
    population_density: 14_410.61, square_housing_stock: 1895.0, living_square_per_person: 16.0, district_id: 20 },
  { id: 71, name: 'Обручевский', square: 6.0, population: 87, population_density: 14_241.41,
    square_housing_stock: 1742.0, living_square_per_person: 21.0, district_id: 19 },
  { id: 72, name: 'Орехово-Борисово Северное', square: 7.0, population: 129,
    population_density: 16_918.9, square_housing_stock: 1939.0, living_square_per_person: 15.0, district_id: 18 },
  { id: 73, name: 'Орехово-Борисово Южное', square: 6.0, population: 146,
    population_density: 21_092.94, square_housing_stock: 2149.0, living_square_per_person: 14.0, district_id: 18 },
  { id: 74, name: 'Останкинский', square: 12.0, population: 63, population_density: 5106.58,
    square_housing_stock: 1131.0, living_square_per_person: 18.0, district_id: 15 },
  { id: 75, name: 'Отрадное', square: 10.0, population: 185, population_density: 18_194.3,
    square_housing_stock: 3191.0, living_square_per_person: 17.0, district_id: 15 },
  { id: 76, name: 'Очаково-Матвеевское', square: 17.0, population: 129,
    population_density: 7354.73, square_housing_stock: 2255.0, living_square_per_person: 19.0, district_id: 20 },
  { id: 77, name: 'Перово', square: 9.0, population: 140, population_density: 14_413.46,
    square_housing_stock: 2248.0, living_square_per_person: 16.0, district_id: 16 },
  { id: 78, name: 'Печатники', square: 17.0, population: 85, population_density: 4763.5,
    square_housing_stock: 1369.0, living_square_per_person: 16.0, district_id: 17 },
  { id: 79, name: 'Покровское-Стрешнево', square: 12.0, population: 58,
    population_density: 4571.71, square_housing_stock: 1006.0, living_square_per_person: 18.0, district_id: 21 },
  { id: 80, name: 'Преображенское', square: 5.0, population: 90,
    population_density: 16_113.01, square_housing_stock: 1453.0, living_square_per_person: 17.0, district_id: 16 },
  { id: 81, name: 'Пресненский', square: 11.0, population: 128,
    population_density: 11_007.18, square_housing_stock: 1416.0, living_square_per_person: 11.0, district_id: 13 },
  { id: 82, name: 'Проспект Вернадского', square: 4.0, population: 64,
    population_density: 13_857.2, square_housing_stock: 1831.0, living_square_per_person: 29.0, district_id: 20 },
  { id: 83, name: 'Раменки', square: 18.0, population: 141, population_density: 7645.85,
    square_housing_stock: 3511.0, living_square_per_person: 27.0, district_id: 20 },
  { id: 84, name: 'Ростокино', square: 3.0, population: 39, population_density: 11_288.42,
    square_housing_stock: 732.0, living_square_per_person: 19.0, district_id: 15 },
  { id: 85, name: 'Рязанский', square: 6.0, population: 110, population_density: 17_031.28,
    square_housing_stock: 2025.0, living_square_per_person: 19.0, district_id: 17 },
  { id: 86, name: 'Савёлки', square: 8.0, population: 34, population_density: 4261.62,
    square_housing_stock: 695.0, living_square_per_person: 21.0, district_id: 22 },
  { id: 87, name: 'Савёловский', square: 2.0, population: 60, population_density: 22_251.48,
    square_housing_stock: 1120.0, living_square_per_person: 19.0, district_id: 14 },
  { id: 88, name: 'Свиблово', square: 4.0, population: 62, population_density: 14_149.89,
    square_housing_stock: 956.0, living_square_per_person: 15.0, district_id: 15 },
  { id: 89, name: 'Северное Бутово', square: 9.0, population: 96,
    population_density: 10_597.26, square_housing_stock: 1751.0, living_square_per_person: 20.0, district_id: 19 },
  { id: 90, name: 'Северное Измайлово', square: 4.0, population: 87,
    population_density: 20_917.38, square_housing_stock: 1624.0, living_square_per_person: 19.0, district_id: 16 },
  { id: 91, name: 'Северное Медведково', square: 5.0, population: 128,
    population_density: 22_619.79, square_housing_stock: 1764.0, living_square_per_person: 14.0, district_id: 15 },
  { id: 92, name: 'Северное Тушино', square: 9.0, population: 164,
    population_density: 17_459.57, square_housing_stock: 2665.0, living_square_per_person: 17.0, district_id: 21 },
  { id: 93, name: 'Северный', square: 10.0, population: 39, population_density: 3793.0,
    square_housing_stock: 620.0, living_square_per_person: 22.0, district_id: 15 },
  { id: 94, name: 'Силино', square: 10.0, population: 40, population_density: 3887.02,
    square_housing_stock: 765.0, living_square_per_person: 19.0, district_id: 22 },
  { id: 95, name: 'Сокол', square: 3.0, population: 58, population_density: 15_663.98,
    square_housing_stock: 1163.0, living_square_per_person: 20.0, district_id: 14 },
  { id: 96, name: 'Соколиная Гора', square: 7.0, population: 91,
    population_density: 11_668.88, square_housing_stock: 1422.0, living_square_per_person: 16.0, district_id: 16 },
  { id: 97, name: 'Сокольники', square: 10.0, population: 60, population_density: 5910.12,
    square_housing_stock: 1247.0, living_square_per_person: 21.0, district_id: 16 },
  { id: 98, name: 'Солнцево', square: 11.0, population: 126, population_density: 11_167.49,
    square_housing_stock: 2058.0, living_square_per_person: 17.0, district_id: 20 },
  { id: 99, name: 'Старое Крюково', square: 3.0, population: 31,
    population_density: 8347.24, square_housing_stock: 566.0, living_square_per_person: 19.0, district_id: 22 },
  { id: 100, name: 'Строгино', square: 16.0, population: 159, population_density: 9449.76,
    square_housing_stock: 2406.0, living_square_per_person: 15.0, district_id: 21 },
  { id: 101, name: 'Таганский', square: 8.0, population: 123, population_density: 15_403.5,
    square_housing_stock: 2380.0, living_square_per_person: 20.0, district_id: 13 },
  { id: 102, name: 'Тверской', square: 7.0, population: 77, population_density: 10_603.99,
    square_housing_stock: 1253.0, living_square_per_person: 16.0, district_id: 13 },
  { id: 103, name: 'Текстильщики', square: 5.0, population: 104,
    population_density: 17_728.89, square_housing_stock: 1638.0, living_square_per_person: 16.0, district_id: 17 },
  { id: 104, name: 'Тёплый Стан', square: 7.0, population: 133, population_density: 17_782.4,
    square_housing_stock: 2406.0, living_square_per_person: 19.0, district_id: 19 },
  { id: 105, name: 'Тимирязевский', square: 10.0, population: 82,
    population_density: 7910.83, square_housing_stock: 1836.0, living_square_per_person: 22.0, district_id: 14 },
  { id: 106, name: 'Тропарёво-Никулино', square: 11.0, population: 122,
    population_density: 10_884.03, square_housing_stock: 2895.0, living_square_per_person: 24.0, district_id: 20 },
  { id: 107, name: 'Филёвский Парк', square: 9.0, population: 94,
    population_density: 9818.09, square_housing_stock: 1605.0, living_square_per_person: 19.0, district_id: 20 },
  { id: 108, name: 'Фили-Давыдково', square: 6.0, population: 113,
    population_density: 16_353.16, square_housing_stock: 2388.0, living_square_per_person: 21.0, district_id: 20 },
  { id: 109, name: 'Хамовники', square: 10.0, population: 108, population_density: 10_787.7,
    square_housing_stock: 2559.0, living_square_per_person: 24.0, district_id: 13 },
  { id: 110, name: 'Ховрино', square: 5.0, population: 87, population_density: 15_307.33,
    square_housing_stock: 2450.0, living_square_per_person: 30.0, district_id: 14 },
  { id: 111, name: 'Хорошёво-Мнёвники', square: 17.0, population: 175,
    population_density: 10_240.05, square_housing_stock: 2918.0, living_square_per_person: 17.0, district_id: 21 },
  { id: 112, name: 'Хорошёвский', square: 9.0, population: 70, population_density: 7183.2,
    square_housing_stock: 2182.0, living_square_per_person: 38.0, district_id: 14 },
  { id: 113, name: 'Царицыно', square: 8.0, population: 128, population_density: 15_217.79,
    square_housing_stock: 1836.0, living_square_per_person: 14.0, district_id: 18 },
  { id: 114, name: 'Черёмушки', square: 5.0, population: 110, population_density: 20_008.7,
    square_housing_stock: 1656.0, living_square_per_person: 16.0, district_id: 19 },
  { id: 115, name: 'Чертаново Северное', square: 5.0, population: 112,
    population_density: 20_873.33, square_housing_stock: 1899.0, living_square_per_person: 17.0, district_id: 18 },
  { id: 116, name: 'Чертаново Центральное', square: 6.0, population: 115,
    population_density: 17_667.79, square_housing_stock: 2907.0, living_square_per_person: 26.0, district_id: 18 },
  { id: 117, name: 'Чертаново Южное', square: 9.0, population: 149,
    population_density: 15_907.25, square_housing_stock: 2192.0, living_square_per_person: 15.0, district_id: 18 },
  { id: 118, name: 'Щукино', square: 7.0, population: 110, population_density: 14_389.21,
    square_housing_stock: 2062.0, living_square_per_person: 20.0, district_id: 21 },
  { id: 119, name: 'Южное Бутово', square: 25.0, population: 208,
    population_density: 8157.99, square_housing_stock: 4195.0, living_square_per_person: 23.0, district_id: 19 },
  { id: 120, name: 'Южное Медведково', square: 3.0, population: 86,
    population_density: 22_265.72, square_housing_stock: 1355.0, living_square_per_person: 16.0, district_id: 15 },
  { id: 121, name: 'Южное Тушино', square: 7.0, population: 108,
    population_density: 13_711.84, square_housing_stock: 1714.0, living_square_per_person: 16.0, district_id: 21 },
  { id: 122, name: 'Южнопортовый', square: 4.0, population: 74,
    population_density: 16_447.68, square_housing_stock: 1449.0, living_square_per_person: 20.0, district_id: 17 },
  { id: 123, name: 'Якиманка', square: 4.0, population: 27, population_density: 5789.79,
    square_housing_stock: 788.0, living_square_per_person: 29.0, district_id: 13 },
  { id: 124, name: 'Ярославский', square: 7.0, population: 97, population_density: 12_203.0,
    square_housing_stock: 1404.0, living_square_per_person: 15.0, district_id: 15 },
  { id: 125, name: 'Ясенево', square: 25.0, population: 179, population_density: 7062.24,
    square_housing_stock: 2969.0, living_square_per_person: 16.0, district_id: 19 }
]

areas_data.each do |data|
  area = Area.find_or_initialize_by(data)
  file_path = "#{Rails.root}/tmp/area_emblems/#{data[:id]}.png"
  if File.exist?(file_path)
    area.emblem.attach(io: File.open(file_path), filename: "#{data[:id]}.png",
                       content_type: 'application/png')
  end
  area.save
end
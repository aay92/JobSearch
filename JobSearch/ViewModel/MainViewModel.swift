import UIKit

class MainViewModel {
    let network = ServiceLayer.shared
    var job: Job?
    
    func getDataWithJobs() async -> Job {
        guard let job = try? await network.fetchDataFirstViewHotel() else
        {
            print("функция getCountJobs не принесла значений")
            return Job(offers: [], vacancies: [])
        }
        return job
    }
}
    
//    func getDataWithJobs(completion: @escaping()->()){
//        Task {
//            do {
//                job = try await network.fetchDataFirstViewHotel()
//                print("Получили с сервера: \(String(describing: job))")
//            } catch {
//                print("Ошибка в получение информации \(String(describing: job))")
//                  
//            }
//        }
//    }
    
//    func getCountJobs()-> [Vacancy] {
//        guard let jobs = job?.vacancies else {
//            print("функция getCountJobs не принесла значений")
//            return [] }
//        return jobs
//    }
    
//}

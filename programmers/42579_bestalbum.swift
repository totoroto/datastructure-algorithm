import Foundation

// 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시
func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let size = genres.count
    var playlist: Dictionary<String, Dictionary<Int, Int>> = [:]
    var sumAboutGenre: Dictionary<String, Int> = [:]
    
    for i in 0..<size {
        let playGenre = genres[i]
        let playCount = plays[i]
        
        // 가장 많이 재생된 장르 계산
        if var sum = sumAboutGenre[playGenre] {
            sum += playCount
            sumAboutGenre.updateValue(sum, forKey: playGenre)
        } else {
            sumAboutGenre.updateValue(playCount, forKey: playGenre)
        }
        
        if var collectGenre = playlist[playGenre] {
            if collectGenre.count >= 2 {
                if playCount > collectGenre.keys.min()! {
                    collectGenre.removeValue(forKey: collectGenre.keys.min()!)
                    
                    if collectGenre[playCount] != nil {
                        /*
                        let genres = ["classic", "pop", "classic", "pop", "classic", "classic"]
                        let plays = [400, 600, 150, 2500, 500, 500]
                        */
                        collectGenre.updateValue(i, forKey: playCount+1)
                    } else {
                        collectGenre.updateValue(i, forKey: playCount)
                    }
                    
                    playlist.updateValue(collectGenre, forKey: playGenre)
                    
                    
                } else if playCount == collectGenre.keys.min()! {
                    // 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록
                    let genreArr = playlist[playGenre]
                    let num = genreArr![playCount] ?? 0
                    print("num: \(num))")
                    if num > i {
                        collectGenre.updateValue(i, forKey: playCount)
                        playlist.updateValue(collectGenre, forKey: playGenre)
                    }
                }
            } else {
                
                if playCount == collectGenre.keys.min()! {
                    // 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록
                    let genreArr = playlist[playGenre]
                    let num = genreArr![playCount] ?? 0
                    print("num: \(num))")
                    if i <= num {
                        collectGenre.updateValue(i, forKey: playCount)
                        playlist.updateValue(collectGenre, forKey: playGenre)
                        print("i: \(i)")
                    }
                } else {
                    collectGenre.updateValue(i, forKey: playCount)
                    playlist.updateValue(collectGenre, forKey: playGenre)
                }
            }
        }
        else {
            var newDic: [Int:Int] = [:]
            newDic.updateValue(i, forKey: playCount)
            playlist.updateValue(newDic, forKey: playGenre)
        }
    }
    
    var result: [Int] = []
    var sortedAlbumKey: [String] = [] // 장르 -> 가장 많이 재생된 순

    sumAboutGenre.sorted(by: {$0.1 > $1.1}).map { (key, value) in
        sortedAlbumKey.append(key)
        
        playlist[key]!.sorted(by: { $0.0 > $1.0 }).map { key, value in
            result.append(value)
        }
    }
    
    print(playlist)
    print(result)
    return result
}


let genres = ["classic", "pop", "classic", "pop", "classic", "classic"]
let plays = [400, 600, 150, 2500, 500, 500]

solution(genres, plays)


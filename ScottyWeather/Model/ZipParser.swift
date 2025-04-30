////
////  zipParser.swift
////  ScottyWeather
////
////  Created by PATTY, SCOTT on 4/30/25.
////
//
//import SwiftUI
//
//class ZipParser {
//    @Published var zips: [LocationModel] = []
//    func readCSV(inputFile: String, ) -> [LocationModel] {
//        var currentZips: [LocationModel] = []
//        if let filepath = Bundle.main.path(forResource: inputFile, ofType: nil) {
//                    do {
//                        let fileContent = try String(contentsOfFile: filepath, encoding: .ascii)
//                        let lines = fileContent.components(separatedBy: "\n")
//                        var results: [String:String] = [:]
//                        lines.dropFirst().forEach { line in
//                            let data = line.components(separatedBy: ",")
//                            
//                            
//                        }
//                        return
//                    } catch {
//                        print("error: \(error)") // to do deal with errors
//                    }
//                } else {
//                    print("\(inputFile) could not be found")
//                }
//    }
//}

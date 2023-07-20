//
//  ContentView.swift
//  Test Watch App
//
//  Created by Christopher Anderson on 7/19/23.
//

import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct ContentView: View {
        
    func getNumber(num: Int) -> Any {
        if (num == 0) {
            return [
                [0, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [1, 0, 0 ,1, 1],
                [1, 0, 1 ,0, 1],
                [1, 1, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 0],
            ]
        } else if (num == 1) {
            return [
                [0, 0, 1 ,0, 0],
                [0, 1, 1 ,0, 0],
                [0, 0, 1 ,0, 0],
                [0, 0, 1 ,0, 0],
                [0, 0, 1 ,0, 0],
                [0, 0, 1 ,0, 0],
                [0, 1, 1 ,1, 0],
            ]
        } else if (num == 2) {
            return [
                [0, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [0, 0, 0 ,0, 1],
                [0, 0, 0 ,1, 0],
                [0, 0, 1 ,0, 0],
                [0, 1, 0 ,0, 0],
                [1, 1, 1 ,1, 1],
            ]
        } else if (num == 3) {
            return [
                [0, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [0, 0, 0 ,0, 1],
                [0, 0, 1 ,1, 0],
                [0, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 0],
            ]
        } else if (num == 4) {
            return [
                [0, 0, 0 ,1, 0],
                [0, 0, 1 ,1, 0],
                [0, 1, 0 ,1, 0],
                [1, 0, 0 ,1, 0],
                [1, 1, 1 ,1, 1],
                [0, 0, 0 ,1, 0],
                [0, 0, 0 ,1, 0],
            ]
        } else if (num == 5) {
            return [
                [1, 1, 1 ,1, 1],
                [1, 0, 0 ,0, 0],
                [1, 1, 1 ,1, 0],
                [0, 0, 0 ,0, 1],
                [0, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 0],
            ]
        } else if (num == 6) {
            return [
                [0, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 0],
                [1, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 0],
            ]
        } else if (num == 7) {
            return [
                [1, 1, 1 ,1, 1],
                [1, 0, 0 ,0, 1],
                [0, 0, 0 ,0, 1],
                [0, 0, 0 ,1, 0],
                [0, 0, 1 ,0, 0],
                [0, 0, 1 ,0, 0],
                [0, 0, 1 ,0, 0],
            ]
        } else if (num == 8) {
            return [
                [0, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 0],
            ]
        } else if (num == 9) {
            return [
                [0, 1, 1 ,1, 0],
                [1, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 1],
                [0, 0, 0 ,0, 1],
                [1, 0, 0 ,0, 1],
                [0, 1, 1 ,1, 0],
            ]
        }
        return 0
    }
    
    func getTime() -> Any {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        let hourString = dateFormatter.string(from: Date())
        dateFormatter.dateFormat = "mm"
        let minuteString = dateFormatter.string(from: Date())
                
        let numberOne = String([hourString.first!])
        let numberTwo = String([hourString.last!])
        let numberThree = String([minuteString.first!])
        let numberFour = String([minuteString.last!])
        
        return [
            getNumber(num: Int(numberOne)!),
            getNumber(num: Int(numberTwo)!),
            getNumber(num: Int(numberThree)!),
            getNumber(num: Int(numberFour)!),
        ]
    }
    
    var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
             matrix = getTime() as! [[[Int]]]
                               })
    }
    
    @State var matrix = [
        [
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
        ],
        [
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
        ],
        [
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
        ],
        [
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
            [0, 0, 0 ,0, 0],
        ]]
    var body: some View {
        VStack {
            HStack {
                Grid {
                    GridRow {
                        Circle().if(matrix[0][0][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][0][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][0][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][0][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][0][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[0][1][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][1][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][1][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][1][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][1][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[0][2][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][2][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][2][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][2][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][2][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[0][3][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][3][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][3][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][3][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][3][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[0][4][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][4][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][4][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][4][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][4][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[0][5][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][5][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][5][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][5][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][5][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[0][6][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][6][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][6][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][6][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[0][6][4] == 0) { view in
                            view.colorInvert()}
                    }
                }.padding(3)
                Grid {
                    GridRow {
                        Circle().if(matrix[1][0][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][0][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][0][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][0][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][0][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[1][1][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][1][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][1][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][1][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][1][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[1][2][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][2][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][2][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][2][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][2][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[1][3][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][3][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][3][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][3][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][3][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[1][4][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][4][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][4][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][4][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][4][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[1][5][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][5][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][5][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][5][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][5][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[1][6][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][6][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][6][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][6][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[1][6][4] == 0) { view in
                            view.colorInvert()}
                    }
                }.padding(3)
            }
            HStack {
                Grid {
                    GridRow {
                        Circle().if(matrix[2][0][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][0][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][0][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][0][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][0][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[2][1][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][1][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][1][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][1][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][1][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[2][2][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][2][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][2][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][2][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][2][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[2][3][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][3][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][3][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][3][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][3][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[2][4][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][4][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][4][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][4][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][4][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[2][5][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][5][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][5][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][5][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][5][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[2][6][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][6][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][6][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][6][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[2][6][4] == 0) { view in
                            view.colorInvert()}
                    }
                }.padding(3)
                Grid {
                    GridRow {
                        Circle().if(matrix[3][0][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][0][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][0][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][0][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][0][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[3][1][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][1][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][1][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][1][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][1][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[3][2][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][2][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][2][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][2][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][2][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[3][3][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][3][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][3][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][3][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][3][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[3][4][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][4][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][4][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][4][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][4][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[3][5][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][5][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][5][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][5][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][5][4] == 0) { view in
                            view.colorInvert()}
                    }
                    GridRow {
                        Circle().if(matrix[3][6][0] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][6][1] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][6][2] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][6][3] == 0) { view in
                            view.colorInvert()}
                        Circle().if(matrix[3][6][4] == 0) { view in
                            view.colorInvert()}
                    }
                }.padding(3)
            }.onAppear {
                let _ = self.updateTimer
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

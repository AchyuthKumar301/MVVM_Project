//
//  ViewModel.swift
//  TestApp
//
//  Created by G Achyuth Kumar on 13/02/24.
//

import Foundation

class ViewModel {
    
    var baseHitData: SMBaseHit = SMBaseHit()
    var success: VoidCompletion?
    var failure: StringCompletion?
}

extension ViewModel {
    
    private func successCompletionHandler() {
        guard let success else { return }
        success()
    }
    
    private func failureCompletionHandler(_ msg: String) {
        guard let failure else { return }
        failure(msg)
    }
}

extension ViewModel {
    
    func callWebserviceForFetchingData() {
        let successCallBack: SuccessResponse = { json in
            self.baseHitData = SMBaseHit(fromDictionary: json)
            self.successCompletionHandler()
        }
        let failureCallBack: Failure = { error in
            let msg = error?.localizedDescription ?? AppMsg.unknownError
            print(msg)
            self.failureCompletionHandler(msg)
        }
        APIClient.shared.callWebserviceForFecthingData(successCallBack: successCallBack,
                                                       failureCallBack: failureCallBack)
    }
}

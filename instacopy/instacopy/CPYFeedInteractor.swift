//
//  CPYFeedInteractor.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

protocol CPYFeedInteractorInput {
    
}

protocol CPYFeedInteractorOutput {
}

class CPYFeedInteractor: CPYBaseInteractor, CPYFeedInteractorInput {

    var output: CPYFeedInteractorOutput?

}

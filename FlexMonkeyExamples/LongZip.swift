//
//  LongZip
//  FlexMonkeyExamples
//
//  Created by Simon Gladman on 10/05/2015.
//  Copyright (c) 2015 Simon Gladman. All rights reserved.
//

func longZip_v1<T, U>(arrayOne:[T], arrayTwo: [U]) -> [(T?, U?)]
{
    let n = max(arrayOne.count, arrayTwo.count)
    
    var returnObjects = [(T?, U?)]()
    
    for var i = 0; i < n; i++
    {
        let returnObject: (T?, U?) = (i < arrayOne.count ? arrayOne[i] : nil, i < arrayTwo.count ? arrayTwo[i] : nil)
        
        returnObjects.append(returnObject)
    }
    
    return returnObjects
}

// ----

func longZip_v2<T, U>(arrayOne:[T], arrayTwo: [U]) -> [(T?, U?)]
{
    var arrayOneExtended = arrayOne.map({$0 as T?})
    var arrayTwoExtended = arrayTwo.map({$0 as U?})
    
    arrayOneExtended.extend([T?](count: max(0, arrayTwo.count - arrayOne.count), repeatedValue: nil))
    arrayTwoExtended.extend([U?](count: max(0, arrayOne.count - arrayTwo.count), repeatedValue: nil))
    
    return Array(zip(arrayOneExtended, arrayTwoExtended))
}

// ----

func longZip_v3<T, U>(arrayOne:[T], arrayTwo: [U]) -> [(T?, U?)]
{
    let newCount = max(arrayOne.count, arrayTwo.count)
    
    let arrayOneExtended = extendWithNil(arrayOne, newCount)
    let arrayTwoExtended = extendWithNil(arrayTwo, newCount)
    
    return Array(zip(arrayOneExtended, arrayTwoExtended))
}

func extendWithNil<T>(array: [T], newCount: Int) -> [T?]
{
    var returnArray = array.map({$0 as T?})
    
    returnArray.extend([T?](count: max(0, newCount - array.count), repeatedValue: nil))
    
    return returnArray
}

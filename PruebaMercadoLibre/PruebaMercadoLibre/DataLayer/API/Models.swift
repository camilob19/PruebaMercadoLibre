//
//  Models.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation

// MARK: - ListModel
struct ListModel: Codable {
    var query: String?
    var paging: Paging?
    var results: [Result]?
    var sort: Sort?
    var availableSorts: [Sort]?
    var filters: [Filter]?
    var availableFilters: [AvailableFilter]?

    enum CodingKeys: String, CodingKey {
        case query, paging, results
        case sort
        case availableSorts
        case filters
        case availableFilters
    }
}

// MARK: - AvailableFilter
struct AvailableFilter: Codable {
    var id, name, type: String?
    var values: [AvailableFilterValue]?
}

// MARK: - AvailableFilterValue
struct AvailableFilterValue: Codable {
    var id, name: String?
    var results: Int?
}

// MARK: - Sort
struct Sort: Codable {
    var id: String?
    var name: String?
}

// MARK: - Filter
struct Filter: Codable {
    var id, name, type: String?
    var values: [FilterValue]?
}

// MARK: - FilterValue
struct FilterValue: Codable {
    var id: String?
    var name: String?
    var pathFromRoot: [Sort]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot
    }
}

// MARK: - Paging
struct Paging: Codable {
    var total, primaryResults, offset, limit: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults
        case offset, limit
    }
}

// MARK: - Result
struct Result: Codable {
    var id: String?
    var title: String?
    var seller: Seller?
    var price: Double?
    var prices: Prices?
    var currencyID: String?
    var availableQuantity, soldQuantity: Int?
    var buyingMode: String?
    var listingTypeID: String?
    var stopTime: String?
    var condition: String?
    var permalink: String?
    var thumbnail: String?
    var acceptsMercadopago: Bool?
    var installments: Installments?
    var address: Address?
    var shipping: Shipping?
    var sellerAddress: SellerAddress?
    var differentialPricing: DifferentialPricing?
    var originalPrice: Int?
    var categoryID: String?
    var officialStoreID: Int?
    var domainID: String?
    var catalogProductID: String?
    var tags: [String]?
    var catalogListing: Bool?
    var orderBackend: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case title, seller, price, prices
        case currencyID
        case availableQuantity
        case soldQuantity
        case buyingMode
        case listingTypeID
        case stopTime
        case condition, permalink, thumbnail
        case acceptsMercadopago
        case installments, address, shipping
        case sellerAddress
        case differentialPricing
        case originalPrice
        case categoryID
        case officialStoreID
        case domainID
        case catalogProductID
        case tags
        case catalogListing
        case orderBackend
    }
}

// MARK: - Address
struct Address: Codable {
    var stateID: String?
    var stateName: String?
    var cityID: String?
    var cityName: String?

    enum CodingKeys: String, CodingKey {
        case stateID
        case stateName
        case cityID
        case cityName
    }
}

// MARK: - Attribute
struct Attribute: Codable {
    var values: [AttributeValue]?
    var attributeGroupName: String?
    var id: String?
    var valueName: String?
    var valueStruct: Struct?
    var source: Int?
    var name: String?
    var valueID: String?
    var attributeGroupID: String?

    enum CodingKeys: String, CodingKey {
        case values
        case attributeGroupName
        case id
        case valueName
        case valueStruct
        case source, name
        case valueID
        case attributeGroupID
    }
}

// MARK: - Struct
struct Struct: Codable {
    var number: Double?
    var unit: String?
}

// MARK: - AttributeValue
struct AttributeValue: Codable {
    var id, name: String?
    var valueStruct: Struct?
    var source: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct
        case source
    }
}


// MARK: - DifferentialPricing
struct DifferentialPricing: Codable {
    var id: Int?
}

// MARK: - Installments
struct Installments: Codable {
    var quantity: Int?
    var amount, rate: Double?
    var currencyID: String?

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID
    }
}

// MARK: - Prices
struct Prices: Codable {
    var id: String?
    var prices: [Price]?
    var presentation: Presentation?

    enum CodingKeys: String, CodingKey {
        case id, prices, presentation
    }
}

// MARK: - Presentation
struct Presentation: Codable {
    var displayCurrency: String?

    enum CodingKeys: String, CodingKey {
        case displayCurrency
    }
}

// MARK: - Price
struct Price: Codable {
    var id: String?
    var type: String?
    var conditions: Conditions?
    var amount: Double?
    var regularAmount: Double?
    var currencyID: String?
    var exchangeRateContext: String?
    var metadata: Metadata?
    var lastUpdated: Date?

    enum CodingKeys: String, CodingKey {
        case id, type, conditions, amount
        case regularAmount
        case currencyID
        case exchangeRateContext
        case metadata
        case lastUpdated
    }
}

// MARK: - Conditions
struct Conditions: Codable {
    var startTime, endTime: Date?
    var eligible: Bool?

    enum CodingKeys: String, CodingKey {
        case startTime
        case endTime
        case eligible
    }
}

// MARK: - Metadata
struct Metadata: Codable {
    var promotionID: String?
    var promotionType: String?
    var campaignID: String?

    enum CodingKeys: String, CodingKey {
        case promotionID
        case promotionType
        case campaignID
    }
}

// MARK: - Seller
struct Seller: Codable {
    var id: Int?
    var permalink: String?
    var registrationDate: String?
    var carDealer, realEstateAgency: Bool?
    var tags: [String]?
    var sellerReputation: SellerReputation?
    var eshop: Eshop?

    enum CodingKeys: String, CodingKey {
        case id, permalink
        case registrationDate
        case carDealer
        case realEstateAgency
        case tags
        case sellerReputation
        case eshop
    }
}

// MARK: - Eshop
struct Eshop: Codable {
    var eshopID, seller: Int?
    var nickName: String?
    var eshopStatusID: Int?
    var eshopLogoURL: String?
    var eshopExperience: Int?

    enum CodingKeys: String, CodingKey {
        case eshopID
        case seller
        case nickName
        case eshopStatusID
        case eshopLogoURL
        case eshopExperience
    }
}

// MARK: - SellerReputation
struct SellerReputation: Codable {
    var levelID: String?
    var powerSellerStatus: String?
    var transactions: Transactions?
    var metrics: Metrics?
    var realLevel, protectionEndDate: String?

    enum CodingKeys: String, CodingKey {
        case levelID
        case powerSellerStatus
        case transactions, metrics
        case realLevel
        case protectionEndDate
    }
}

// MARK: - Metrics
struct Metrics: Codable {
    var sales: Sales?
    var claims, delayedHandlingTime, cancellations: Cancellations?

    enum CodingKeys: String, CodingKey {
        case sales, claims
        case delayedHandlingTime
        case cancellations
    }
}

// MARK: - Cancellations
struct Cancellations: Codable {
    var period: String?
    var rate: Double?
    var value: Int?
    var excluded: Excluded?
}

// MARK: - Excluded
struct Excluded: Codable {
    var realValue: Int?
    var realRate: Double?

    enum CodingKeys: String, CodingKey {
        case realValue
        case realRate
    }
}

// MARK: - Sales
struct Sales: Codable {
    var period: String?
    var completed: Int?
}

// MARK: - Transactions
struct Transactions: Codable {
    var canceled, completed: Int?
    var period: String?
    var ratings: Ratings?
    var total: Int?
}

// MARK: - Ratings
struct Ratings: Codable {
    var negative, neutral, positive: Double?
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    var id, comment, addressLine, zipCode: String?
    var country, state, city: Sort?
    var latitude, longitude: String?

    enum CodingKeys: String, CodingKey {
        case id, comment
        case addressLine
        case zipCode
        case country, state, city, latitude, longitude
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    var freeShipping: Bool?
    var mode: String?
    var tags: [String]?
    var logisticType: String?
    var storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping
        case mode, tags
        case logisticType
        case storePickUp
    }
}

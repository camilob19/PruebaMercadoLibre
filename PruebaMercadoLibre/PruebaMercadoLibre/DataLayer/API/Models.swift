//
//  Models.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation

// MARK: - ListModel
struct ListModel: Codable {
    let siteID: SiteID?
    let query: String?
    let paging: Paging?
    let results: [Result]?
    let secondaryResults, relatedResults: [JSONAny]?
    let sort: Sort?
    let availableSorts: [Sort]?
    let filters: [Filter]?
    let availableFilters: [AvailableFilter]?

    enum CodingKeys: String, CodingKey {
        case siteID
        case query, paging, results
        case secondaryResults
        case relatedResults
        case sort
        case availableSorts
        case filters
        case availableFilters
    }
}

// MARK: - AvailableFilter
struct AvailableFilter: Codable {
    let id, name, type: String?
    let values: [AvailableFilterValue]?
}

// MARK: - AvailableFilterValue
struct AvailableFilterValue: Codable {
    let id, name: String?
    let results: Int?
}

// MARK: - Sort
struct Sort: Codable {
    let id: String?
    let name: String?
}

// MARK: - Filter
struct Filter: Codable {
    let id, name, type: String?
    let values: [FilterValue]?
}

// MARK: - FilterValue
struct FilterValue: Codable {
    let id: CategoryID?
    let name: String?
    let pathFromRoot: [Sort]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot
    }
}

enum CategoryID: String, Codable {
    case mla1055 = "MLA1055"
}

// MARK: - Paging
struct Paging: Codable {
    let total, primaryResults, offset, limit: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults
        case offset, limit
    }
}

// MARK: - Result
struct Result: Codable {
    let id: String?
    let siteID: SiteID?
    let title: String?
    let seller: Seller?
    let price: Int?
    let prices: Prices?
    let salePrice: JSONNull?
    let currencyID: CurrencyID?
    let availableQuantity, soldQuantity: Int?
    let buyingMode: BuyingMode?
    let listingTypeID: ListingTypeID?
    let stopTime: String?
    let condition: Condition?
    let permalink: String?
    let thumbnail: String?
    let acceptsMercadopago: Bool?
    let installments: Installments?
    let address: Address?
    let shipping: Shipping?
    let sellerAddress: SellerAddress?
    let attributes: [Attribute]?
    let differentialPricing: DifferentialPricing?
    let originalPrice: Int?
    let categoryID: CategoryID?
    let officialStoreID: Int?
    let domainID: DomainID?
    let catalogProductID: String?
    let tags: [ResultTag]?
    let catalogListing: Bool?
    let orderBackend: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case siteID
        case title, seller, price, prices
        case salePrice
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
        case attributes
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
    let stateID: StateID?
    let stateName: StateName?
    let cityID: String?
    let cityName: String?

    enum CodingKeys: String, CodingKey {
        case stateID
        case stateName
        case cityID
        case cityName
    }
}

enum StateID: String, Codable {
    case arB = "AR-B"
    case arC = "AR-C"
    case arS = "AR-S"
    case arT = "AR-T"
    case arX = "AR-X"
}

enum StateName: String, Codable {
    case buenosAires = "Buenos Aires"
    case capitalFederal = "Capital Federal"
    case córdoba = "Córdoba"
    case santaFe = "Santa Fe"
    case tucumán = "Tucumán"
}

// MARK: - Attribute
struct Attribute: Codable {
    let values: [AttributeValue]?
    let attributeGroupName: AttributeGroupName?
    let id: ID?
    let valueName: String?
    let valueStruct: Struct?
    let source: Int?
    let name: Name?
    let valueID: String?
    let attributeGroupID: AttributeGroupID?

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

enum AttributeGroupID: String, Codable {
    case others = "OTHERS"
}

enum AttributeGroupName: String, Codable {
    case otros = "Otros"
}

enum ID: String, Codable {
    case brand = "BRAND"
    case gpuModel = "GPU_MODEL"
    case itemCondition = "ITEM_CONDITION"
    case line = "LINE"
    case model = "MODEL"
    case packageLength = "PACKAGE_LENGTH"
    case packageWeight = "PACKAGE_WEIGHT"
    case processorModel = "PROCESSOR_MODEL"
    case weight = "WEIGHT"
}

enum Name: String, Codable {
    case condiciónDelÍtem = "Condición del ítem"
    case largoDelPaquete = "Largo del paquete"
    case línea = "Línea"
    case marca = "Marca"
    case modelo = "Modelo"
    case modeloDeGPU = "Modelo de GPU"
    case modeloDelProcesador = "Modelo del procesador"
    case peso = "Peso"
    case pesoDelPaquete = "Peso del paquete"
}

// MARK: - Struct
struct Struct: Codable {
    let number: Double?
    let unit: Unit?
}

enum Unit: String, Codable {
    case cm = "cm"
    case g = "g"
}

// MARK: - AttributeValue
struct AttributeValue: Codable {
    let id, name: String?
    let valueStruct: Struct?
    let source: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct
        case source
    }
}

enum BuyingMode: String, Codable {
    case buyItNow = "buy_it_now"
}

enum Condition: String, Codable {
    case new = "new"
}

enum CurrencyID: String, Codable {
    case ars = "ARS"
}

// MARK: - DifferentialPricing
struct DifferentialPricing: Codable {
    let id: Int?
}

enum DomainID: String, Codable {
    case mlaCellphones = "MLA-CELLPHONES"
}

// MARK: - Installments
struct Installments: Codable {
    let quantity: Int?
    let amount, rate: Double?
    let currencyID: CurrencyID?

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID
    }
}

enum ListingTypeID: String, Codable {
    case goldPro = "gold_pro"
    case goldSpecial = "gold_special"
}

// MARK: - Prices
struct Prices: Codable {
    let id: String?
    let prices: [Price]?
    let presentation: Presentation?
    let paymentMethodPrices: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case id, prices, presentation
        case paymentMethodPrices
    }
}

// MARK: - Presentation
struct Presentation: Codable {
    let displayCurrency: CurrencyID?

    enum CodingKeys: String, CodingKey {
        case displayCurrency
    }
}

// MARK: - Price
struct Price: Codable {
    let id: String?
    let type: TypeEnum?
    let conditions: Conditions?
    let amount: Int?
    let regularAmount: Int?
    let currencyID: CurrencyID?
    let exchangeRateContext: ExchangeRateContext?
    let metadata: Metadata?
    let lastUpdated: Date?

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
    let contextRestrictions: [JSONAny]?
    let startTime, endTime: Date?
    let eligible: Bool?

    enum CodingKeys: String, CodingKey {
        case contextRestrictions
        case startTime
        case endTime
        case eligible
    }
}

enum ExchangeRateContext: String, Codable {
    case exchangeRateContextDEFAULT = "DEFAULT"
}

// MARK: - Metadata
struct Metadata: Codable {
    let promotionID: String?
    let promotionType: PromotionType?
    let campaignID: CampaignID?

    enum CodingKeys: String, CodingKey {
        case promotionID
        case promotionType
        case campaignID
    }
}

enum CampaignID: String, Codable {
    case mla5167 = "MLA5167"
    case mla5339 = "MLA5339"
    case mla5392 = "MLA5392"
}

enum PromotionType: String, Codable {
    case campaign = "campaign"
    case custom = "custom"
    case dealOfTheDay = "deal_of_the_day"
}

enum TypeEnum: String, Codable {
    case promotion = "promotion"
    case standard = "standard"
}

// MARK: - Seller
struct Seller: Codable {
    let id: Int?
    let permalink: String?
    let registrationDate: String?
    let carDealer, realEstateAgency: Bool?
    let tags: [SellerTag]?
    let sellerReputation: SellerReputation?
    let eshop: Eshop?

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
    let eshopID, seller: Int?
    let nickName: String?
    let eshopStatusID: Int?
    let siteID: SiteID?
    let eshopLogoURL: String?
    let eshopExperience: Int?
    let eshopRubro: JSONNull?
    let eshopLocations: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case eshopID
        case seller
        case nickName
        case eshopStatusID
        case siteID
        case eshopLogoURL
        case eshopExperience
        case eshopRubro
        case eshopLocations
    }
}

enum SiteID: String, Codable {
    case mla = "MLA"
}

// MARK: - SellerReputation
struct SellerReputation: Codable {
    let levelID: LevelID?
    let powerSellerStatus: PowerSellerStatus?
    let transactions: Transactions?
    let metrics: Metrics?
    let realLevel, protectionEndDate: String?

    enum CodingKeys: String, CodingKey {
        case levelID
        case powerSellerStatus
        case transactions, metrics
        case realLevel
        case protectionEndDate
    }
}

enum LevelID: String, Codable {
    case the3_Yellow = "3_yellow"
    case the5_Green = "5_green"
}

// MARK: - Metrics
struct Metrics: Codable {
    let sales: Sales?
    let claims, delayedHandlingTime, cancellations: Cancellations?

    enum CodingKeys: String, CodingKey {
        case sales, claims
        case delayedHandlingTime
        case cancellations
    }
}

// MARK: - Cancellations
struct Cancellations: Codable {
    let period: CancellationsPeriod?
    let rate: Double?
    let value: Int?
    let excluded: Excluded?
}

// MARK: - Excluded
struct Excluded: Codable {
    let realValue: Int?
    let realRate: Double?

    enum CodingKeys: String, CodingKey {
        case realValue
        case realRate
    }
}

enum CancellationsPeriod: String, Codable {
    case the365Days = "365 days"
    case the60Days = "60 days"
}

// MARK: - Sales
struct Sales: Codable {
    let period: CancellationsPeriod?
    let completed: Int?
}

enum PowerSellerStatus: String, Codable {
    case platinum = "platinum"
    case silver = "silver"
}

// MARK: - Transactions
struct Transactions: Codable {
    let canceled, completed: Int?
    let period: TransactionsPeriod?
    let ratings: Ratings?
    let total: Int?
}

enum TransactionsPeriod: String, Codable {
    case historic = "historic"
}

// MARK: - Ratings
struct Ratings: Codable {
    let negative, neutral, positive: Double?
}

enum SellerTag: String, Codable {
    case brand = "brand"
    case creditsActiveBorrower = "credits_active_borrower"
    case creditsPriority1 = "credits_priority_1"
    case creditsPriority2 = "credits_priority_2"
    case creditsPriority4 = "credits_priority_4"
    case creditsProfile = "credits_profile"
    case developer = "developer"
    case eshop = "eshop"
    case largeSeller = "large_seller"
    case mediumSeller = "medium_seller"
    case messagesAsBuyer = "messages_as_buyer"
    case messagesAsSeller = "messages_as_seller"
    case mshops = "mshops"
    case normal = "normal"
    case userInfoVerified = "user_info_verified"
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    let id, comment, addressLine, zipCode: String?
    let country, state, city: Sort?
    let latitude, longitude: String?

    enum CodingKeys: String, CodingKey {
        case id, comment
        case addressLine
        case zipCode
        case country, state, city, latitude, longitude
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool?
    let mode: Mode?
    let tags: [ShippingTag]?
    let logisticType: LogisticType?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping
        case mode, tags
        case logisticType
        case storePickUp
    }
}

enum LogisticType: String, Codable {
    case crossDocking = "cross_docking"
    case custom = "custom"
    case dropOff = "drop_off"
    case fulfillment = "fulfillment"
    case notSpecified = "not_specified"
    case xdDropOff = "xd_drop_off"
}

enum Mode: String, Codable {
    case custom = "custom"
    case me2 = "me2"
    case notSpecified = "not_specified"
}

enum ShippingTag: String, Codable {
    case fbmInProcess = "fbm_in_process"
    case fulfillment = "fulfillment"
    case mandatoryFreeShipping = "mandatory_free_shipping"
    case me2Available = "me2_available"
    case selfServiceIn = "self_service_in"
    case selfServiceOut = "self_service_out"
}

enum ResultTag: String, Codable {
    case bestSellerCandidate = "best_seller_candidate"
    case brandVerified = "brand_verified"
    case cartEligible = "cart_eligible"
    case catalogBoost = "catalog_boost"
    case dealOfTheDay = "deal_of_the_day"
    case extendedWarrantyEligible = "extended_warranty_eligible"
    case goodQualityPicture = "good_quality_picture"
    case goodQualityThumbnail = "good_quality_thumbnail"
    case immediatePayment = "immediate_payment"
    case loyaltyDiscountEligible = "loyalty_discount_eligible"
    case shippingGuaranteed = "shipping_guaranteed"
    case the3XCampaign = "3x_campaign"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

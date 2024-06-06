use serde::{Deserialize, Serialize};

#[derive(Deserialize, Debug, Serialize)]
pub struct Asset {
    pub assetId: u32,
    pub assetType: String,
    pub decimals: u32,
    pub displayDecimals: u32,
    pub metadata: serde_json::Value,
    pub settles: bool,
    pub sourceId: u32,
    pub status: u32,
    pub symbol: String,
}

#[derive(Deserialize, Debug, Serialize)]
pub struct Source {
    pub addressExplorer: Option<String>,
    pub metadata: serde_json::Value,
    pub name: String,
    pub sourceId: u32,
    pub transactionExplorer: Option<String>,
}

#[derive(Deserialize, Debug, Serialize)]
pub struct Market {
    pub baseAssetId: u32,
    pub baseLotSize: String,
    pub feeTableId: u32,
    pub isImplied: Option<bool>,
    pub isPrimary: Option<bool>,
    pub marketId: u32,
    pub minOrderQty: Option<u32>,
    pub priceBandAskPct: u32,
    pub priceBandBidPct: u32,
    pub priceDisplayDecimals: u32,
    pub priceTickSize: String,
    pub protectionPriceLevels: u32,
    pub quantityTickSize: String,
    pub quoteAssetId: u32,
    pub quoteLotSize: String,
    pub status: u32,
    pub symbol: String,
}

#[derive(Deserialize, Debug, Serialize)]
pub struct FeeTier {
    pub makerFeeRatio: f64,
    pub priority: u32,
    pub takerFeeRatio: f64,
}

#[derive(Deserialize, Debug, Serialize)]
pub struct FeeTable {
    pub feeTableId: u32,
    pub feeTiers: Vec<FeeTier>,
}

#[derive(Deserialize, Serialize, Debug)]
pub struct MarketResponse {
    pub assets: Vec<Asset>,
    pub sources: Vec<Source>,
    pub markets: Vec<Market>,
    pub feeTables: Vec<FeeTable>,
}

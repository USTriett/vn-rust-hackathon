use serde::Serialize;

#[derive(Serialize, Debug)]
pub struct CoinInfo {
    pub symbol: String,
    pub price: f64,
    pub change_24h: f64,
    pub volume: f64,
}

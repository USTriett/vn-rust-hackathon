use serde::{Deserialize, Serialize};

#[derive(Deserialize, Debug, Serialize)]
pub struct Kline {
    pub time: u64,
    pub open: f64,
    pub high: f64,
    pub low: f64,
    pub close: f64,
    pub volume: String,
}

#[derive(Deserialize, Debug, Serialize)]
pub struct KlineResponse {
    pub result: Vec<Kline>,
}

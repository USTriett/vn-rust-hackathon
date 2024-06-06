use crate::entity::market::MarketResponse;
use crate::error::AppError;
use std::{fs, marker};


pub async fn fetch_market_info() -> Result<MarketResponse, AppError> {
    // println!("Fetching market info...");

    // Send GET request
    // let client = reqwest::Client::new();
    // let response = client
    //     .get("https://api.cube.exchange/ir/v0/markets")
    //     .send()
    //     .await
    //     .map_err(|e| {
    //         eprintln!("Request error: {}", e);
    //         AppError::InternalError
    //     })?;

      // Read the JSON file
    let response = fs::read_to_string("response.json").map_err(|e| {
        eprintln!("File read error: {}", e);
        AppError::InternalError
    })?;

    // response -> result 


    // Parse the JSON response
    let market_info: MarketResponse = serde_json::from_str(&response).map_err(|e| {
        eprintln!("JSON parse error: {}", e);
        AppError::InternalError
    })?;

    Ok(market_info)
}

use std::alloc::System;
use std::time::{SystemTime, UNIX_EPOCH};

use crate::service::{market_service::fetch_market_info, klines::fetch_klines};
use crate::entity::coinDto::CoinInfo;
use crate::error::AppError;


pub async fn get_combined_coin_info() -> Result<Vec<CoinInfo>, AppError> {

    println!("Fetching combined coin info...");
    // Fetch market info
    let market_info = fetch_market_info().await?;

    println!("Market info fetched successfully.");
    // print market_info
    println!("{:?}", market_info);

    // Iterate through markets and fetch kline data
    let mut coin_info_list = Vec::new();
    for market in market_info.markets {
        let symbol = market.symbol.clone();

        println!("Fetching klines for symbol: {}", symbol);

        let market_id = market.marketId;
        let start_time = SystemTime::now().duration_since(UNIX_EPOCH).expect("Time went backwards").as_secs() - 86400;
        let end_time = SystemTime::now().duration_since(UNIX_EPOCH).expect("Time went backwards").as_secs();


        let klines = fetch_klines(market_id, "1h", Some(start_time as i64), Some(end_time as i64), Some(1)).await?;
        
        if let Some(latest_kline) = klines.result.last() {
            let price = latest_kline.close;
            let volume: f64 = latest_kline.volume.parse().unwrap_or(0.0);
            
            // Calculate 24h change
            let open_price = latest_kline.open;
            let change_24h = (price - open_price) / open_price * 100.0;
            
            coin_info_list.push(CoinInfo {
                symbol: market.symbol,
                price,
                change_24h,
                volume,
            });
        }
    }

    // print coin_info_list
    println!("{:?}", coin_info_list);
    
    Ok(coin_info_list)
}
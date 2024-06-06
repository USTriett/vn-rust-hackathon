use crate::entity::klines::KlineResponse;
use crate::error::AppError;

pub async fn fetch_klines(market_id: u32, interval: &str, start_time: Option<i64>, end_time: Option<i64>, limit: Option<u16>) -> Result<KlineResponse, AppError> {

    println!("Fetching klines for marketId: {}", market_id);

    // Send GET request
    let client = reqwest::Client::new();
    let mut url = format!("https://api.cube.exchange/history/klines?marketId={}&interval={}", market_id, interval);

    // if let Some(start_time) = start_time {
    //     url = format!("{}&startTime={}", url, start_time);
    // }

    // if let Some(end_time) = end_time {
    //     url = format!("{}&endTime={}", url, end_time);
    // }

    // if let Some(limit) = limit {
    //     url = format!("{}&limit={}", url, limit);
    // }

    println!("Request URL: {}", url);

    let response = client
        .get(&url)
        .send()
        .await
        .map_err(|_| AppError::InternalError)?;

    // Get the response text
    let response_text = response.text().await.map_err(|_| AppError::InternalError)?;

    println!("Response text: {}", response_text);

    // Parse the JSON response
    let kline_data: KlineResponse = serde_json::from_str(&response_text).map_err(|_| AppError::InternalError)?;
    Ok(kline_data)
}
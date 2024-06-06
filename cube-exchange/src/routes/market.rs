use axum::{
    routing::get,
    Router,
    response::IntoResponse,
    Json,
};
use hyper::StatusCode;
use crate::service::market_service::fetch_market_info;
use crate::service::auth::AuthHeaders;
use crate::service::coins::get_combined_coin_info;


pub fn router(auth_headers: AuthHeaders) -> Router {
    let router = Router::new()
    .route("/info", get(get_market_info))
    .route("/coin", get(get_coin_info));

    return router;
}

async fn get_market_info() -> impl IntoResponse {
    match fetch_market_info().await {
        Ok(market_info) => Json(market_info).into_response(),
        Err(err) => {
            let body = format!("Failed to render template. Error: {}", err);
            let response = axum::http::Response::builder()
                .status(StatusCode::INTERNAL_SERVER_ERROR)
                .body(axum::body::Body::from(body))
                .unwrap();
            response.into_response()
        },
    }
}



async fn get_coin_info() -> impl IntoResponse {
    match get_combined_coin_info().await {
        Ok(info) => Json(info).into_response(),
        Err(e) => {
            eprintln!("Error: {}", e);
            let body = format!("Failed to get combined coin info. Error: {}", e);
            let response = axum::http::Response::builder()
                .status(StatusCode::INTERNAL_SERVER_ERROR)
                .body(axum::body::Body::from(body))
                .unwrap();
            response.into_response()
        },
    }
}
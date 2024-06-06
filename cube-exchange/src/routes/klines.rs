use axum::{
    routing::get,
    Router,
    response::IntoResponse,
    extract::Query,
    Json,
};
use crate::service::klines::fetch_klines;
use crate::service::auth::AuthHeaders;
use serde::Deserialize;
use hyper::StatusCode;

#[derive(Deserialize)]
struct KlineParams {
    symbol: String,
    interval: String,
}

// pub fn router(auth_headers: AuthHeaders) -> Router {
//     let auth_headers_clone = auth_headers.clone();
//     Router::new()
//         .route("/klines", get(move |params: Query<KlineParams>| get_klines(params)))
// }

// async fn get_klines(params: Query<KlineParams>) -> impl IntoResponse {
//     match fetch_klines(&params.symbol, &params.interval).await {
//         Ok(klines) => Json(klines).into_response(),
//         Err(e) => {
//             eprintln!("Error: {}", e);
//             let body = format!("Failed to fetch klines. Error: {}", e);
//             let response = axum::http::Response::builder()
//                 .status(StatusCode::INTERNAL_SERVER_ERROR)
//                 .body(axum::body::Body::from(body))
//                 .unwrap();
//             response.into_response()
//         },
//     }
// }

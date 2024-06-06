use axum::{
    routing::get,
    Router,
    response::IntoResponse,
};
use crate::service::user_service::save_subaccount_info;
use crate::service::auth::AuthHeaders;

pub fn router(auth_headers: AuthHeaders) -> Router {
    Router::new()
        .route("/subaccount_info", get(move || get_subaccount_info(auth_headers.clone())))
}

async fn get_subaccount_info(auth_headers: AuthHeaders) -> impl IntoResponse {
    match save_subaccount_info(&auth_headers).await {
        Ok(_) => (axum::http::StatusCode::OK, "Subaccount info processed successfully").into_response(),
        Err(e) => {
            eprintln!("Error: {}", e);
            (axum::http::StatusCode::INTERNAL_SERVER_ERROR, "Internal Server Error").into_response()
        },
    }
}

use axum::Router;
use service::auth;

use std::net::SocketAddr;

mod config;
mod service;
mod routes;
mod entity;
mod error;

#[tokio::main]
async fn main() {

    config::parameter::init();

    let auth_headers = auth::AuthHeaders::new(
        &config::parameter::get("API_KEY").unwrap(),
        &config::parameter::get("SECRET_KEY").unwrap(),
    ).unwrap();

    
    // Create the main router and nest market and user routers
    let app = Router::new()
        .nest("/market", routes::market::router(auth_headers.clone()))
        .nest("/user", routes::user::router(auth_headers.clone()));
        // .nest("/kline", routes::klines::router(auth_headers.clone()));

    // Define the address to serve on
    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    println!("Listening on {}", addr);

    // Run our application
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

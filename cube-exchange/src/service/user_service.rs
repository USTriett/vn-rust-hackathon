use reqwest::header::{HeaderMap, HeaderValue};
use crate::entity::user::UserResponse;
use crate::service::auth::AuthHeaders;
use crate::error::AppError;

pub async fn fetch_user_profile(auth_headers: &AuthHeaders) -> Result<UserResponse, AppError> {
    let mut headers = HeaderMap::new();
    headers.insert("x-api-key", HeaderValue::from_str(&auth_headers.api_key).map_err(|_| AppError::InternalError)?);
    headers.insert("x-api-signature", HeaderValue::from_str(&auth_headers.api_signature).map_err(|_| AppError::InternalError)?);

    let client = reqwest::Client::new();
    let url = "https://api.cube.exchange/ir/v0/users/info";
    let response = client
        .get(url)
        .headers(headers)
        .send()
        .await
        .map_err(|_| AppError::InternalError)?;

    let user_info: UserResponse = response.json().await.map_err(|_| AppError::InternalError)?;
    Ok(user_info)
}

pub async fn save_subaccount_info(auth_headers: &AuthHeaders) -> Result<(), AppError> {
    let user_info = fetch_user_profile(auth_headers).await?;

    if let Some(subaccount) = user_info.subaccounts.first() {
        // Save or process subaccount info here
        println!("Subaccount ID: {}", subaccount.id);
        println!("Subaccount Name: {}", subaccount.name);
        println!("Addresses: {:?}", subaccount.addresses);
        // You can add additional processing or saving logic here
    } else {
        println!("No subaccounts found.");
    }

    Ok(())
}

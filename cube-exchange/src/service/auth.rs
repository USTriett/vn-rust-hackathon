use hmac::{Hmac, Mac};
use sha2::Sha256;
use std::time::{SystemTime, UNIX_EPOCH};
use base64::{engine::general_purpose::STANDARD, Engine};
use hex;
use crate::error::AppError;

type HmacSha256 = Hmac<Sha256>;

#[derive(Clone)]
pub struct AuthHeaders {
    pub api_key: String,
    pub api_signature: String,
}

impl AuthHeaders {
    pub fn new(api_key: &str, secret_key: &str) -> Result<Self, AppError> {
        // Get current timestamp in seconds
        let timestamp = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .map_err(|_| AppError::InternalError)?
            .as_secs();
        
        // Convert timestamp to 8-byte little-endian array
        let timestamp_bytes = timestamp.to_le_bytes();

        // Concatenate "cube.xyz" and the timestamp byte array
        let payload = [&b"cube.xyz"[..], &timestamp_bytes[..]].concat();

        // Decode the secret key from hex string to byte array
        let secret_key_bytes = hex::decode(secret_key).map_err(|_| AppError::InternalError)?;

        // Create HMAC-SHA256 signature
        let mut mac = HmacSha256::new_from_slice(&secret_key_bytes).map_err(|_| AppError::InternalError)?;
        mac.update(&payload);
        let signature_bytes = mac.finalize().into_bytes();

        // Encode signature to base64
        let signature_base64 = STANDARD.encode(signature_bytes);

        Ok(Self {
            api_key: api_key.to_string(),
            api_signature: signature_base64,
        })
    }
}

use dotenv;

use crate::error::AppError;

pub fn init() {
    dotenv::dotenv().ok().expect("Failed to load .env file");
}

pub fn get(parameter: &str) -> Result<String, AppError> {
    match std::env::var(parameter) {
        Ok(value) => Ok(value),
        Err(_) => Err(AppError::EnvVarError {var_name: parameter.to_string()}),
    }
}
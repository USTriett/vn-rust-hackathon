use core::fmt;

use thiserror::Error;

#[derive(Error, Debug)]
pub enum AppError {
    #[error("Internal Server Error")]
    InternalError,


    #[error("Invalid Request")]
    InvalidRequest,

    // can't read env file
    #[error("Failed to load .env file")]
    EnvError,

    // can't find env variable
    #[error("Environment variable not found: {var_name}")]
    EnvVarError { var_name: String },

    // can't connect to database
    #[error("Failed to connect to database")]
    DatabaseError,

    #[error("Failed to fetch data")]
    InternalServerError,
    
}

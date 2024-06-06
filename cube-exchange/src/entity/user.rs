use serde::Deserialize;
use std::collections::HashMap;

#[derive(Deserialize, Debug)]
pub struct Subaccount {
    pub addresses: HashMap<String, String>,
    pub hasOrderHistory: bool,
    pub id: u64,
    pub name: String,
}

#[derive(Deserialize, Debug)]
pub struct ApiKey {
    pub isMasterKey: bool,
    pub subaccountIds: Vec<u64>,
    pub accessLevel: String,
    pub apiKey: String,
    pub createdAt: String,
}

#[derive(Deserialize, Debug)]
pub struct UserResponse {
    pub apiKeys: Vec<ApiKey>,
    pub subaccounts: Vec<Subaccount>,
    pub id: String,
    pub email: String,
    pub status: String,
    pub guardianHasKey: Vec<Guardian>,
    pub hasGuardianQuorum: bool,
    pub phoneNumber: String,
    pub hasApprovedKyc: bool,
    pub registration: Registration,
    pub firstName: String,
    pub lastName: String,
    pub country: String,
    pub inviteId: String,
    pub referralCode: String,
}

#[derive(Deserialize, Debug)]
pub struct Guardian {
    pub name: String,
    pub hasKey: bool,
}

#[derive(Deserialize, Debug)]
pub struct Registration {
    pub newlyStarted: bool,
    pub startedAt: String,
}

use reqwest::header::{HeaderMap, HeaderValue};
use serde_json::json;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let mut headers = HeaderMap::new();

    headers.insert(
        "Neon-Connection-String",
        HeaderValue::from_static("postgres://postgres:grafbase@db.localtest.me:5432/postgres"),
    );

    headers.insert("Neon-Raw-Text-Output", HeaderValue::from_static("false"));
    headers.insert("Neon-Array-Mode", HeaderValue::from_static("false"));
    headers.insert("Neon-Pool-Opt-In", HeaderValue::from_static("true"));

    let client = reqwest::ClientBuilder::new()
        .default_headers(headers)
        .danger_accept_invalid_certs(true)
        .build()?;

    let res = client
        .post("https://postgres:grafbase@db.localtest.me:4444/sql")
        .json(&json!({
            "query": "SELECT 1",
            "params": []
        }))
        .send()
        .await?;

    let body: serde_json::Value = res.json().await?;

    dbg!(body);

    Ok(())
}

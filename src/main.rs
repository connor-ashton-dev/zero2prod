use std::net::TcpListener;

use zero2prod::configuration::get_configuration;
use zero2prod::startup::run;

#[tokio::main]
async fn main() -> Result<(), std::io::Error> {
    let configuration = get_configuration().expect("Failed to read config");
    let addr = format!("127.0.0.1:{}", configuration.application_port);

    let tcp_listener = TcpListener::bind(addr)?;
    run(tcp_listener)?.await
}

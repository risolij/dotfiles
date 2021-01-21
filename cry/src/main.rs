extern crate clap;
extern crate easy_http_request;
extern crate serde_json;

use clap::{Arg, App, ArgMatches};
use std::process;
use std::fmt;
use easy_http_request::DefaultHttpRequest;
use serde_json::{Result, Value};

#[derive(Debug)]
enum Req {
    GET(String),
    POST(String),
}

fn get_args() -> Req {
    let matches = App::new("cry")
        .version("1.0")
        .author("crypto")
        .about("Crypto api logging")
        .subcommand(
            App::new("get")
            .arg(
                Arg::new("api")
                    .required(true)))
        .subcommand(
            App::new("post")
            .arg(
                Arg::new("api")
                    .required(true)))
        .get_matches();

    match matches.subcommand() {
        Some(("get", m))    => Req::GET(m.value_of("api").unwrap().to_string()),
        Some(("post", m))   => Req::POST(m.value_of("api").unwrap().to_string()),
        _                   => process::exit(1),
    }
}

fn get_request(get: &String) {
    let response = DefaultHttpRequest::get_from_url_str(get)
        .unwrap()
        .send()
        .unwrap();

    let v: Vec<Value> = serde_json::from_str(&String::from_utf8(response.body).unwrap())
        .unwrap();

    println!("{0: <10} {1: <30} {2: <20} {3: <30} => {4: <30}", 
             "Symbol", 
             "Name", 
             "Price", 
             "Circulating Supply",
             "Total Supply");

    let repeat = std::iter::repeat("=")
        .take(140)
        .collect::<String>();

    println!("{}", repeat);

    for item in &v {
        let name    = &item.pointer("/name")
            .unwrap_or(&Value::Null)
            .as_str()
            .unwrap_or("null");

        let symbol  = &item.pointer("/symbol")
            .unwrap_or(&Value::Null)
            .as_str()
            .unwrap_or("null");

        let price   = &item.pointer("/market_data/current_price/usd")
            .unwrap_or(&Value::Null)
            .as_f64()
            .unwrap_or(0.0);

        let cirsup  = &item.pointer("/market_data/circulating_supply")
            .unwrap_or(&Value::Null)
            .as_str()
            .unwrap_or("null");

        let totsup  = &item.pointer("/market_data/total_supply")
            .unwrap_or(&Value::Null)
            .as_str()
            .unwrap_or("null");
        

        println!("{0: <10} {1: <30} {2: <20} {3: <30} => {4: <30}", 
            symbol,
            name,
            price,
            cirsup,
            totsup
        );
    }
}

fn post_request(post: &String) {
    println!("Post request => {}", post);
}

fn main() {
    let reqtype = get_args();

    match reqtype {
        Req::GET(api)  => get_request(&api),
        Req::POST(api) => post_request(&api),
    }
}

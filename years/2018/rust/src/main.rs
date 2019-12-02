use std::io::{self, BufReader};
use std::io::prelude::*;
use std::fs::File;
use std::collections::HashMap;

fn main() -> io::Result<()> {
    let f = File::open("src/input.txt")?;
    let f = BufReader::new(f);
    let mut result: i32 = 0;
    let mut duplicate;
    let done = false;
    let mut freq_map = HashMap::new();
    freq_map.insert(result, true);
    for line in f.lines() {
        let addition = line.unwrap();
        let sign = addition.chars().next().unwrap();
        let value: i32 = addition[1..].parse().unwrap();
        if sign == '-' {
            result = result - value;
        } else {
            result = result + value;
        }
        match freq_map.get(&result) {
            Some(&false) => freq_map.insert(result, true),
            Some(&true) => println!("Test"),
            None => freq_map.insert(result, true);
        }
    }
    println!("Final Frequency: {}", result);

    Ok(())
}
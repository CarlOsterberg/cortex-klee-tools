#[derive(Clone)]
pub struct Settings {
    pub rust: bool,
    pub verbose: bool,
}


impl Settings {
    pub fn new(is_rust: bool, is_verbose: bool) -> Settings {
        Settings {
            rust: is_rust,
            verbose: is_verbose,
        }
    }
}
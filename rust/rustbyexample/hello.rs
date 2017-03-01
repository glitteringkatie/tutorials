#[derive(Debug)]
struct Structure(i32);

#[derive (Debug)]
struct Deep(Structure);

fn main() {
    println!("Hello World!");
    println!("I'm a Rustacean!");
    println!("{} of {:b} people know binary, the other half don't", 1, 2);
    println!("{number:>0width$}", number=1, width=6);
    println!("My name is {1}, {0} {1}", "James", "Bond");

    let pi = 3.1415926535897932384626433;
    println!("{:.3}", pi);

    println!("{:?} months in a year.", 12);
    println!("{1:?} {0:?} is the {actor:?} name.",
             "Levi",
             "Zachary",
             actor="actor's");

    println!("Now {:?} will print!", Structure(3));
    println!("Now {:?} will print!", Deep(Structure(7)));
}

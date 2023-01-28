import os

fn main() {
	args := os.args.clone()

	if args.len != 2 {
		println("\e[1;31mError: Invalid number of arguments\e[0m")
		println('Usage: ccss <file>')
	}

	if !os.exists(args[1]) {
		println("\e[1;31mError: File does not exist\e[0m")
	}
	
	mut source := os.read_file(args[1])!
	println(source)
}
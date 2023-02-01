import os

fn main() {
	args := os.args.clone()

	if args.len != 2 {
		println("\e[1;31mError: Invalid number of arguments\e[0m")
		println('Usage: ccss <file>')
		return
	}

	if !os.exists(args[1]) {
		println("\e[1;31mError: File does not exist\e[0m")
		return
	}
	
	mut source := os.read_file(args[1])!
	
	for line in source.split_into_lines() {
		if line.starts_with('#') {
			continue
		}
	}
}
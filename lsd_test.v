module vlsd

struct Go2VInlineStruct {
mut:
	lhs  string
	rhs  string
	want int
}

fn test_distance() {
	mut tests := [
		Go2VInlineStruct{'こんにちわ世界', 'こんにちわ世界', 0},
		Go2VInlineStruct{'こんにちわ世界', 'こにゃちわ世界', 2},
		Go2VInlineStruct{'こんにちわ世界', 'こにゃにゃちわ世界', 3},
		Go2VInlineStruct{'こんにちわ世界', 'こんばんわ世界', 2},
		Go2VInlineStruct{'こんにちわ世界', 'こんにちわ', 2},
		Go2VInlineStruct{'こんにちわ世界', 'こんばんわ', 4},
		Go2VInlineStruct{'こんにちわ世界', '世界', 5},
	]
	for _, test in tests {
		got := string_distance(test.lhs, test.rhs)
		assert got == test.want
	}
}

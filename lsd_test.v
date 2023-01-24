module lsd

struct Go2VInlineStruct {
mut:
	lhs  string
	rhs  string
	want int
}

pub fn test_distance(t &testing.T) {
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
		mut got := string_distance(test.lhs, test.rhs)
		if got != test.want {
			t.fatalf('want %v but %v: %v vs %v', test.want, got, test.lhs, test.rhs)
		}
	}
}

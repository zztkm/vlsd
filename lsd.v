module vlsd

// distance returns the levenshtein distance between two `[]rune`
pub fn distance(lhs_1 []rune, rhs_1 []rune) int {
	mut rl1, rl2 := lhs_1.len, rhs_1.len
	mut costs := []int{len: rl1 + 1}
	for j := 1; j <= rl1; j++ {
		costs[j] = j
	}
	mut cost := 0
	mut last := 0
	mut prev := 0
	for i := 1; i <= rl2; i++ {
		costs[0] = i
		last = i - 1
		for j_1 := 1; j_1 <= rl1; j_1++ {
			prev = costs[j_1]
			cost = 0
			if lhs_1[j_1 - 1] != rhs_1[i - 1] {
				cost = 1
			}
			if costs[j_1] + 1 < costs[j_1 - 1] + 1 {
				if costs[j_1] + 1 < last + cost {
					costs[j_1] = costs[j_1] + 1
				} else {
					costs[j_1] = last + cost
				}
			} else {
				if costs[j_1 - 1] + 1 < last + cost {
					costs[j_1] = costs[j_1 - 1] + 1
				} else {
					costs[j_1] = last + cost
				}
			}
			last = prev
		}
	}
	return costs[rl1]
}

// string_distance returns the levenshtein distance between two `string`
pub fn string_distance(lhs string, rhs string) int {
	return distance(lhs.runes(), rhs.runes())
}

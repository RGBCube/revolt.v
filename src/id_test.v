module revolt

fn test_id() {
	ids := [
		'01FHAY2QP8B50A661620CJDTK3',
	]!
	expected := [
		1633528405704,
	]!

	for i, id in ids {
		idh := IdHolder{id}

		assert idh.created_at().unix == expected[i]
	}
}

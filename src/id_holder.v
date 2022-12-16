module revolt

import time
import encoding.binary
import encoding.base32

const ulid_base32_alphabet = '0123456789ABCDEFGHJKMNPQRSTVWXYZ'.bytes()

// IdHolder is a holder for ULID. Every Revolt object has an (UL)ID.
[noinit]
pub struct IdHolder {
	id string
}

// FIXME: This is broken.

// created_at returns the creation time of the IdHolder.
pub fn (idh IdHolder) created_at() !Time {
	encoder := base32.new_encoding_with_padding(revolt.ulid_base32_alphabet, base32.no_padding)

	str_10_bytes := idh.id[..10].bytes()
	u64_bytes := encoder.decode(str_10_bytes) or { return error('invalid ULID') }

	milliseconds_total := dump(binary.big_endian_u64_end(u64_bytes))
	seconds := i64(milliseconds_total / 1000)
	microseconds := int(milliseconds_total % 1000) * 1000
	return time.unix2(seconds, microseconds * 1000)
}

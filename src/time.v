module revolt

import time

// Time is a time.Time that can be formatted as a Revolt timestamp.
pub type Time = time.Time

// TimeFormat is an enum of all possible Revolt timestamp formats.
// See https://developers.revolt.chat/markdown#timestamps.
pub enum TimeFormat as u8 {
	short_time = u8(`t`) // 21:27
	long_time = u8(`T`) // 21:27:42
	short_date = u8(`d`) // 4/12/2022
	long_date = u8(`D`) // 4 December 2022
	short_date_time = u8(`f`) // 4 December 2022 21:27
	long_date_time = u8(`F`) // Sunday, 4 December 2022 21:27
	relative = u8(`R`) // 2 days ago, Now, etc.
}

// format returns a Revolt representation of the time in the given format.
// E.g. `<t:1670178420:f>` for `TimeFormat.short_date_time` ran on a time of `1670178420`.
[inline]
pub fn (t Time) format(format TimeFormat) string {
	return '<t:${t.unix}:${rune(format)}>'
}

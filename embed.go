package tzfrel

import (
	_ "embed"
)

//go:embed timezones.pb
var FullData []byte

//go:embed timezones.reduce.pb
var LiteData []byte

//go:embed timezones.reduce.compress.pb
var LiteCompressData []byte

//go:embed timezones.reduce.preindex.pb
var PreindexData []byte

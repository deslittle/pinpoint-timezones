download:
	wget https://github.com/evansiroky/timezone-boundary-builder/releases/latest/download/timezones-with-oceans.shapefile.zip
	unzip timezones-with-oceans.shapefile.zip

install:
	npm install -g --silent geobuf
	go install github.com/deslittle/pinpoint/cmd/geojson2locpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/reducelocpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/compresslocpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/preindexlocpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/namegeojson@v0.3.1

gen: clean install download
	shp2geobuf combined-shapefile-with-oceans.shp > timezones.pbf
	geobuf2json timezones.pbf > timezones-allprops.json
	namegeojson timezones-allprops.json timezones.json tzid
	geojson2locpb timezones.json
	reducelocpb timezones.pb
	compresslocpb timezones.reduce.pb
	preindexlocpb timezones.reduce.pb

clean:
	rm -f *.zip* *-with-oceans*.* *.json  *.pbf

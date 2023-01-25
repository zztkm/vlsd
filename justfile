# run test
test:
	v test .

# format v files
fmt:
	v fmt -w .

# report suspicious code constructs
vet:
	v vet .

# generate module document
doc:
	v doc -o docs/ -f markdown .

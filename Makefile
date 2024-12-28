SHELL := /bin/bash

# Grabs all words after the 'new' target.
TITLE := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

.PHONY: new
new:
	@./new.sh "$(TITLE)"

# Stop Make from interpreting the extra words as targets.
%:
	@:

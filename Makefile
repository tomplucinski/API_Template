.PHONY: unit-test integration-test acceptance-test test build_ start-dependencies run stop stop-dependencies validate

################################################
# INTEGRATION TASK SUITE
################################################

unit-test:
	$(info ~~~~~~~~~ UNIT TEST ~~~~~~~~~)
	./gradlew clean test

integration-test:
	$(info ~~~~~~~~~ INTEGRATION TEST ~~~~~~~~~)
	./gradlew clean :integrationTest

acceptance-test:
	$(info ~~~~~~~~~ ACCEPTANCE TEST ~~~~~~~~~)
	cd acceptance-test && ./gradlew clean build cucumberTest --info && cd ..

test: unit-test acceptance-test

build_:
	$(info ~~~~~~~~~ BUILD ~~~~~~~~~)
	./gradlew build

start-dependencies:
	$(info ~~~~~~~~~ START DEPENDENCIES ~~~~~~~~~)
	./support/scripts/run.sh

run:
	$(info ~~~~~~~~~ RUN ~~~~~~~~~)
	./support/scripts/run.sh

stop:
	$(info ~~~~~~~~~ STOP ~~~~~~~~~)
	lsof -ti:8080 |  | xargs kill

stop-dependencies:
	$(info ~~~~~~~~~ STOP DEPENDENCIES ~~~~~~~~~)
	docker compose stop

validate: test build_ start-dependencies run acceptance-test
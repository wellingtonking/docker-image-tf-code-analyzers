
FILE?=pipeline.yaml
PIPELINE?=docker-image-tf-code-analyzers
JOB?=build-and-push

TARGET?=alpha

TEAM_NAME?=main

set-pipeline:
	fly -t $(TARGET) set-pipeline --pipeline $(PIPELINE) --config $(FILE) --non-interactive

destroy-pipeline:
	fly -t $(TARGET) destroy-pipeline -p $(PIPELINE)

unpause-pipeline:
	fly -t $(TARGET) unpause-pipeline -p $(PIPELINE)

pause-pipeline:
	fly -t $(TARGET) pause-pipeline -p $(PIPELINE)

trigger:
	fly -t $(TARGET) trigger-job -j $(PIPELINE)/$(JOB)

watch:
	fly -t $(TARGET) watch -j $(PIPELINE)/$(JOB)

intercept:
	fly -t $(TARGET) intercept -j $(PIPELINE)/$(JOB)



set-pipeline-instances:
	fly -t $(TARGET) set-pipeline --pipeline $(PIPELINE) --config $(FILE) --non-interactive --instance-var branch=main
	fly -t $(TARGET) set-pipeline --pipeline $(PIPELINE) --config $(FILE) --non-interactive --instance-var branch=branch

destroy-pipeline-instances:
	fly -t $(TARGET) destroy-pipeline -p $(PIPELINE)/branch:main
	fly -t $(TARGET) destroy-pipeline -p $(PIPELINE)/branch:branch

test:
	fly -t $(TARGET) set-pipeline --pipeline $(PIPELINE) --non-interactive --instance-var branch=dev



# ex:
# fly -t alpha intercept -j translastor-broker/build-and-push-image
# fly -t alpha intercept -j translastor-broker/golang-1.18-build-and-push -s get-version-tag


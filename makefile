#===============================================================================
#
# drone-gdm/makefile:
#
# Copyright (c) 2017 The New York Times Company
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this library except in compliance with the License.
# You may obtain a copy of the License at:
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#-------------------------------------------------------------------------------

# Build and test:
all: drone-gdm test

# Build drone-gdm for the current target:
drone-gdm: *.go
	go build

# PHONY targets:
# (See: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html)
.PHONY: clean test docker-bin

# Execute tests:
test: drone-gdm
	go test -v ./...

# Build drone-gdm for AMD64/Linux (i.e. for packaging in docker image):
docker-bin:
	./util/docker-build.sh

# Clean up build output:
clean:
	rm -vf drone-gdm



#!/bin/bash
cd /ai2 && \
chmod +x *.sh && \
./startAIServer.sh > aiserver.log && \
./startBuildServer.sh > buildserver.log

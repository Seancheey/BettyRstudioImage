CONTAINER_NAME=betty-rstudio
docker rm -f ${CONTAINER_NAME}
docker run -d \
  --name ${CONTAINER_NAME} \
  -p 8787:8787 \
  -e PASSWORD=xin \
  --memory="48g" \
  --memory-swap="-1" \
  -v /Users/seancheey/Desktop/unsynced_workspace/RStudioData:/home/rstudio/data \
  sean/rstudio-v3

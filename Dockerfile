FROM google/cloud-sdk:latest AS gcloud

RUN apt-get install -yqq google-cloud-sdk-gke-gcloud-auth-plugin

FROM gcr.io/distroless/base-debian10

COPY --from=gcloud /usr/bin/gke-gcloud-auth-plugin /gke-gcloud-auth-plugin

ENTRYPOINT [ "/gke-gcloud-auth-plugin" ]
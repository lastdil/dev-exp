version: 0.25.0

repositories:
  - name: bitnami
    url: https://charts.bitnami.com/bitnami

{{/*General options*/}}
.options: &options
  wait: true

releases:
  - name: redis
    chart:
      name: bitnami/redis
      version: 17.3.17
    namespace: "default"
    {{/*yaml says "Who is the last one is right."*/}}
    values:
       {{/*Default*/}}
      - values/_.yml
      {{/*For specific ENVIRONMENT*/}}
    <<: *options

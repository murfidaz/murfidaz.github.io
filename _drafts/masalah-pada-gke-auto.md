jadi masalahnya adalah ketika aplikasi dijalankan dilocalhost, aplikasinya berjalan dengan cepat,
namun setelah dideploy ke kubernete malah lemot sekali, jadi problemnya ada dimana?

- Tanya chat GPT jawabannya ya begitu

- Pod bursting, ini entah apa
  https://cloud.google.com/kubernetes-engine/docs/how-to/pod-bursting-gke

contoh limit dan request
resources:
limits:
cpu: 1
ephemeral-storage: 2Gi
memory: 512Mi
requests:
cpu: 1 ini harus angka saja, beda sama storage dan memory
ephemeral-storage: 2Gi
memory: 512Mi

- Stackgres kenapa lemot
  https://www.reddit.com/r/kubernetes/comments/v61ypo/stackgres_postgresql_operator/

- Service nggk perlu simpan database, jadi simpan kemana?
